import 'package:core/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:proj4dart/proj4dart.dart' as proj4;
import 'dart:math' as math;

typedef MapTapCallback = void Function(LatLng position);

enum AppMapType { osm, satellite }

class AppMap extends StatefulWidget {
  final LatLng? initialCenter;
  final double? initialZoom;
  final bool disableScrollWheelZoom;
  final bool disableInteractiveMap;
  final List<Widget> layers;
  final MapTapCallback? onTap;
  final PositionCallback? onPositionChanged;
  final MapController? mapController;

  const AppMap({
    super.key,
    required this.layers,
    this.initialCenter,
    this.initialZoom,
    this.disableScrollWheelZoom = false,
    this.disableInteractiveMap = false,
    this.onTap,
    this.onPositionChanged,
    this.mapController,
  });

  @override
  State<AppMap> createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
  static const double _defaultInitialZoom = 2.0;
  final popupController = PopupController();
  var mapType = AppMapType.osm;

  final espg3346 = proj4.Projection.parse(
    'PROJCS["LKS_1994_Lithuania_TM",GEOGCS["GCS_LKS_1994",DATUM["D_Lithuania_1994",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Transverse_Mercator"],PARAMETER["False_Easting",500000.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",24.0],PARAMETER["Scale_Factor",0.9998],PARAMETER["Latitude_Of_Origin",0.0],UNIT["Meter",1.0]]',
  );

  static const espg3346OsmResolutions = [
    1322.9193125052918,
    793.7515875031751,
    529.1677250021168,
    264.5838625010584,
    132.2919312505292,
    66.1459656252646,
    26.458386250105836,
    13.229193125052918,
    6.614596562526459,
    2.6458386250105836,
    1.3229193125052918,
    0.5291677250021167,
    0.26458386250105836,
    0.13229193125052918,
  ];

  final double maxZoomOsm = espg3346OsmResolutions.length - 1;

  late final espg3346OsmCRS = Proj4Crs.fromFactory(
    code: 'EPSG:3346:osm',
    proj4Projection: espg3346,
    bounds: Bounds<double>(
      const math.Point<double>(-3868431.3448, 3787209.7969000004),
      const math.Point<double>(3227425.9922, 9284025.053),
    ),
    origins: const [
      math.Point(-5122000, 10000100),
    ],
    resolutions: espg3346OsmResolutions,
  );

  static const espg3346HybridResolutions = [
    1322.9193125052918,
    793.7515875031751,
    529.1677250021168,
    264.5838625010584,
    132.2919312505292,
    66.1459656252646,
    26.458386250105836,
    13.229193125052918,
    6.614596562526459,
    2.6458386250105836,
  ];

  final double maxZoomHybrid = espg3346HybridResolutions.length - 1;

  late final espg3346HybridCRS = Proj4Crs.fromFactory(
    code: 'EPSG:3346:hybrid',
    proj4Projection: espg3346,
    bounds: Bounds<double>(
      const math.Point<double>(236725.44661756046, 5930813.423926848),
      const math.Point<double>(717678.0543561094, 6291634.374735416),
    ),
    origins: const [
      math.Point(-5122000, 10000100),
    ],
    resolutions: espg3346HybridResolutions,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PopupController>(create: (_) => popupController),
      ],
      child: PopupScope(
        popupController: popupController,
        child: FlutterMap(
          mapController: widget.mapController,
          options: MapOptions(
            crs: _getCRS(),
            onPositionChanged: widget.onPositionChanged,
            initialZoom: widget.initialZoom ?? _defaultInitialZoom,
            initialCenter:
                widget.initialCenter ?? GlobalConstants.lithuaniaCenterLatLng,
            minZoom: _getMinZoom(),
            maxZoom: _getMaxZoom(),
            interactionOptions: InteractionOptions(
              flags: _getInteractiveFlags(),
            ),
            // Hide popup when the map is tapped.
            onTap: (_, position) {
              final onTap = widget.onTap;
              if (onTap != null) {
                onTap(position);
              } else {
                popupController.hideAllPopups();
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: _getTileUrlTemplate(),
              tileDisplay: const TileDisplay.instantaneous(),
              tileProvider: CancellableNetworkTileProvider(
                silenceExceptions: true,
              ),
              tileSize: 512,
            ),
            ...widget.layers,
            if (!widget.disableInteractiveMap)
              _ButtonsLayer(
                mapType: mapType,
                onChangeMapType: _changeMapType,
              ),
            if (!widget.disableInteractiveMap)
              RichAttributionWidget(
                animationConfig: const ScaleRAWA(),
                showFlutterMapAttribution: false,
                alignment: AttributionAlignment.bottomLeft,
                attributions: [_getAttribution()],
              ),
          ],
        ),
      ),
    );
  }

  void _changeMapType(MapController mapController, AppMapType mapType) {
    // Satellite supports less zoom levels so we need adjustments
    if (mapType == AppMapType.satellite &&
        mapController.camera.zoom > maxZoomHybrid) {
      mapController.move(mapController.camera.center, maxZoomHybrid);
    }

    setState(() {
      this.mapType = mapType;
    });
  }

  double _getMaxZoom() {
    return switch (mapType) {
      AppMapType.osm => maxZoomOsm,
      AppMapType.satellite => maxZoomHybrid,
    };
  }

  double _getMinZoom() {
    return switch (mapType) {
      AppMapType.osm => 0,
      AppMapType.satellite => 1,
    };
  }

  String _getTileUrlTemplate() {
    return switch (mapType) {
      AppMapType.osm =>
        'https://www.geoportal.lt/mapproxy/gisc_pagrindinis/MapServer/tile/{z}/{y}/{x}',
      AppMapType.satellite =>
        'https://www.geoportal.lt/mapproxy/gisc_misrus_public/MapServer/tile/{z}/{y}/{x}'
    };
  }

  Crs _getCRS() {
    return switch (mapType) {
      AppMapType.osm => espg3346OsmCRS,
      AppMapType.satellite => espg3346HybridCRS,
    };
  }

  TextSourceAttribution _getAttribution() {
    return switch (mapType) {
      AppMapType.osm => TextSourceAttribution(
          'geoportal.lt',
          onTap: () => launchUrl(
            Uri.parse(
                'https://www.geoportal.lt/mapproxy/gisc_pagrindinis/MapServer'),
          ),
        ),
      AppMapType.satellite => TextSourceAttribution(
          'Nacionalinė žemės tarnyba prie Aplinkos ministerijos',
          onTap: () => launchUrl(
            Uri.parse('https://www.nzt.lt/'),
          ),
        ),
    };
  }

  int _getInteractiveFlags() {
    if (widget.disableInteractiveMap) {
      return InteractiveFlag.none;
    }

    int flags = InteractiveFlag.all ^ InteractiveFlag.rotate;
    if (widget.disableScrollWheelZoom) {
      flags ^= InteractiveFlag.scrollWheelZoom;
    }

    return flags;
  }
}

class _ButtonsLayer extends StatelessWidget {
  final AppMapType mapType;
  final void Function(MapController mapController, AppMapType mapType)
      onChangeMapType;

  static const _fitBoundsPadding = EdgeInsets.all(12);

  const _ButtonsLayer({
    required this.mapType,
    required this.onChangeMapType,
  });

  @override
  Widget build(BuildContext context) {
    final controller = MapController.of(context);
    final camera = MapCamera.of(context);

    final minZoom = camera.minZoom;
    final maxZoom = camera.maxZoom;
    if (minZoom == null || maxZoom == null) {
      throw Exception('Min and max zooms should be set');
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
              ),
              child: Tooltip(
                message: mapType == AppMapType.osm
                    ? 'Palydovinis žemėlapis'
                    : 'Topografinis žemėlapis',
                child: ToggleButtons(
                  onPressed: (_) {
                    final newType = mapType == AppMapType.osm
                        ? AppMapType.satellite
                        : AppMapType.osm;

                    onChangeMapType(controller, newType);
                  },
                  isSelected: const [false],
                  children: [
                    if (mapType == AppMapType.osm) const Icon(Icons.satellite),
                    if (mapType == AppMapType.satellite) const Icon(Icons.map),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
              ),
              child: ToggleButtons(
                direction: Axis.vertical,
                onPressed: (int index) {
                  if (index == 0) {
                    final paddedMapCamera = CameraFit.bounds(
                      bounds: camera.visibleBounds,
                      padding: _ButtonsLayer._fitBoundsPadding,
                    ).fit(camera);
                    final zoom = math.min(paddedMapCamera.zoom + 1, maxZoom);
                    controller.move(paddedMapCamera.center, zoom);
                  } else {
                    final paddedMapCamera = CameraFit.bounds(
                      bounds: camera.visibleBounds,
                      padding: _ButtonsLayer._fitBoundsPadding,
                    ).fit(camera);
                    var zoom = paddedMapCamera.zoom - 1;
                    if (zoom < minZoom) {
                      zoom = minZoom;
                    }
                    controller.move(paddedMapCamera.center, zoom);
                  }
                },
                isSelected: const [false, false],
                children: const [
                  Icon(Icons.add),
                  Icon(Icons.remove),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
