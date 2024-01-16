import 'package:core/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'layers/map_buttons_layer.dart';

typedef MapTapCallback = void Function(LatLng position);

enum OSMMapType { osm, satellite }

class OSMMapTypeProvider extends ChangeNotifier {
  OSMMapType _mapType = OSMMapType.osm;

  OSMMapType get mapType => _mapType;

  set mapType(OSMMapType mapType) {
    _mapType = mapType;
    notifyListeners();
  }
}

class OSMMap extends StatefulWidget {
  final LatLng? initialCenter;
  final double? initialZoom;
  final bool disableScrollWheelZoom;
  final bool disableInteractiveMap;
  final List<Widget> layers;
  final MapTapCallback? onTap;
  final PositionCallback? onPositionChanged;

  const OSMMap({
    super.key,
    required this.layers,
    this.initialCenter,
    this.initialZoom,
    this.disableScrollWheelZoom = false,
    this.disableInteractiveMap = false,
    this.onTap,
    this.onPositionChanged,
  });

  @override
  State<OSMMap> createState() => _OSMMapState();
}

class _OSMMapState extends State<OSMMap> {
  static const _defaultInitialZoom = 7.0;
  final popupController = PopupController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PopupController>(create: (_) => popupController),
        ChangeNotifierProvider<OSMMapTypeProvider>(
            create: (_) => OSMMapTypeProvider()),
      ],
      child: PopupScope(
        popupController: popupController,
        child: FlutterMap(
          options: MapOptions(
            onPositionChanged: widget.onPositionChanged,
            initialZoom: widget.initialZoom ?? _defaultInitialZoom,
            initialCenter:
                widget.initialCenter ?? GlobalConstants.lithuaniaCenterLatLng,
            interactionOptions: InteractionOptions(
              flags: _getInteractiveFlags(),
            ),
            minZoom: 6,
            maxZoom: 19,
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
            Consumer<OSMMapTypeProvider>(
              builder: (context, config, _) {
                return _TileLayer(type: config.mapType);
              },
            ),
            ...widget.layers,
            Consumer<OSMMapTypeProvider>(
              builder: (context, config, _) {
                return OSMMapButtonsLayer(osmMapType: config.mapType);
              },
            ),
            RichAttributionWidget(
              animationConfig: const ScaleRAWA(),
              showFlutterMapAttribution: false,
              alignment: AttributionAlignment.bottomLeft,
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => launchUrl(
                    Uri.parse(
                      'https://openstreetmap.org/copyright',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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

class _TileLayer extends StatelessWidget {
  final OSMMapType type;

  const _TileLayer({required this.type});

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      OSMMapType.osm => _buildOsmTileLayer(),
      OSMMapType.satellite => _buildSatelliteLayer(),
    };
  }

  Widget _buildOsmTileLayer() {
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    );
  }

  Widget _buildSatelliteLayer() {
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    );
  }
}
