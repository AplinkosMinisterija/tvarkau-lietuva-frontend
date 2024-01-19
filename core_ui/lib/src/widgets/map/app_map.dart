import 'dart:async';

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

  final StreamController<void> resetController = StreamController.broadcast();

  _MapTileProvider tileProvider = _GeoPortalOSMTileProvider();

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
            crs: tileProvider.crs,
            onPositionChanged: widget.onPositionChanged,
            initialZoom: widget.initialZoom ?? _defaultInitialZoom,
            initialCenter:
                widget.initialCenter ?? GlobalConstants.lithuaniaCenterLatLng,
            minZoom: tileProvider.minZoom.toDouble(),
            maxZoom: tileProvider.maxZoom.toDouble(),
            applyPointerTranslucencyToLayers: false,
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
              urlTemplate: tileProvider.urlTemplate,
              reset: resetController.stream,
              tileProvider: CancellableNetworkTileProvider(
                silenceExceptions: true,
              ),
              tileSize: tileProvider.tileSize,
              panBuffer: 0,
              evictErrorTileStrategy: EvictErrorTileStrategy.dispose,
              tileUpdateTransformer: TileUpdateTransformers.throttle(
                const Duration(microseconds: 200),
              ),
            ),
            ...widget.layers,
            if (!widget.disableInteractiveMap)
              _ButtonsLayer(
                tileProvider: tileProvider,
                onChangeMapType: _changeMapType,
              ),
            if (!widget.disableInteractiveMap)
              RichAttributionWidget(
                animationConfig: const ScaleRAWA(),
                showFlutterMapAttribution: false,
                alignment: AttributionAlignment.bottomLeft,
                attributions: [
                  TextSourceAttribution(
                    tileProvider.attributionText,
                    onTap: () => launchUrl(
                      Uri.parse(tileProvider.attributionUrl),
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _changeMapType(
    MapController mapController,
    _MapTileProvider newTileProvider,
  ) {
    // Satellite supports less zoom levels so we need adjustments
    if (mapController.camera.zoom > newTileProvider.maxZoom) {
      mapController.move(
        mapController.camera.center,
        newTileProvider.maxZoom.toDouble(),
      );
    }

    setState(() {
      tileProvider = newTileProvider;
    });

    // Reset and dispose cached
    resetController.add(null);
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

  @override
  void dispose() {
    resetController.close();
    popupController.dispose();

    super.dispose();
  }
}

class _ButtonsLayer extends StatelessWidget {
  final _MapTileProvider tileProvider;
  final void Function(
    MapController mapController,
    _MapTileProvider tileProvider,
  ) onChangeMapType;

  static const _fitBoundsPadding = EdgeInsets.all(16);

  const _ButtonsLayer({
    required this.tileProvider,
    required this.onChangeMapType,
  });

  _MapTileProvider get _toggleTitleProvider {
    return switch (tileProvider) {
      _GeoPortalOSMTileProvider() => _OpenStreetTileProvider(),
      _OpenStreetTileProvider() => _GeoPortalHybridTileProvider(),
      _GeoPortalHybridTileProvider() => _GeoPortalOSMTileProvider(),
    };
  }

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
                message: _toggleTitleProvider.title,
                child: ToggleButtons(
                  onPressed: (_) {
                    final newTileProvider = _toggleTitleProvider;

                    onChangeMapType(controller, newTileProvider);
                  },
                  isSelected: const [false],
                  children: [
                    switch (_toggleTitleProvider) {
                      _GeoPortalOSMTileProvider() => const Icon(
                          Icons.map,
                        ),
                      _OpenStreetTileProvider() => const Icon(
                          Icons.bug_report,
                        ),
                      _GeoPortalHybridTileProvider() => const Icon(
                          Icons.satellite,
                        ),
                    }
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

sealed class _MapTileProvider {
  static final _espg3346 = proj4.Projection.parse(
    'PROJCS["LKS_1994_Lithuania_TM",GEOGCS["GCS_LKS_1994",DATUM["D_Lithuania_1994",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Transverse_Mercator"],PARAMETER["False_Easting",500000.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",24.0],PARAMETER["Scale_Factor",0.9998],PARAMETER["Latitude_Of_Origin",0.0],UNIT["Meter",1.0]]',
  );

  final String title;
  final Crs crs;
  final String urlTemplate;
  final double tileSize;
  final int minZoom;
  final int maxZoom;
  final String attributionText;
  final String attributionUrl;

  _MapTileProvider({
    required this.title,
    required this.crs,
    required this.urlTemplate,
    required this.tileSize,
    required this.minZoom,
    required this.maxZoom,
    required this.attributionText,
    required this.attributionUrl,
  });
}

class _GeoPortalOSMTileProvider implements _MapTileProvider {
  static const _resolutions = [
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

  @override
  String get attributionText => 'geoportal.lt';

  @override
  String get attributionUrl =>
      'https://www.geoportal.lt/mapproxy/gisc_pagrindinis/MapServer';

  @override
  Crs get crs => Proj4Crs.fromFactory(
        code: 'EPSG:3346:gisc_pagrindinis',
        proj4Projection: _MapTileProvider._espg3346,
        bounds: Bounds<double>(
          const math.Point<double>(-3868431.3448, 3787209.7969000004),
          const math.Point<double>(3227425.9922, 9284025.053),
        ),
        origins: const [
          math.Point(-5122000, 10000100),
        ],
        resolutions: _resolutions,
      );

  @override
  int get maxZoom => _resolutions.length - 1;

  @override
  int get minZoom => 0;

  @override
  double get tileSize => 512;

  @override
  String get urlTemplate =>
      'https://www.geoportal.lt/mapproxy/gisc_pagrindinis/MapServer/tile/{z}/{y}/{x}';

  @override
  String get title => 'Topografinis žemėlapis';
}

class _GeoPortalHybridTileProvider implements _MapTileProvider {
  static const _resolutions = [
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

  @override
  String get title => 'Palydovinis žemėlapis';

  @override
  String get attributionText =>
      'Nacionalinė žemės tarnyba prie Aplinkos ministerijos';

  @override
  String get attributionUrl => 'https://www.nzt.lt/';

  @override
  Crs get crs => Proj4Crs.fromFactory(
        code: 'EPSG:3346:gisc_misrus_public',
        proj4Projection: _MapTileProvider._espg3346,
        bounds: Bounds<double>(
          const math.Point<double>(236725.44661756046, 5930813.423926848),
          const math.Point<double>(717678.0543561094, 6291634.374735416),
        ),
        origins: const [
          math.Point(-5122000, 10000100),
        ],
        resolutions: _resolutions,
      );

  @override
  int get maxZoom => _resolutions.length - 1;

  @override
  int get minZoom => 1;

  @override
  double get tileSize => 512;

  @override
  String get urlTemplate =>
      'https://www.geoportal.lt/mapproxy/gisc_misrus_public/MapServer/tile/{z}/{y}/{x}';
}

class _OpenStreetTileProvider implements _MapTileProvider {
  @override
  String get attributionText => 'OpenStreetMap';

  @override
  String get attributionUrl => 'https://www.openstreetmap.org/';

  @override
  Crs get crs => const Epsg3857();

  @override
  int get maxZoom => 21;

  @override
  int get minZoom => 0;

  @override
  double get tileSize => 256;

  @override
  String get urlTemplate => 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  @override
  String get title => 'OpenStreetMap žemėlapis';
}
