import 'package:core/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'layers/map_zoom_in_out_buttons_layer.dart';

typedef MapTapCallback = void Function(LatLng position);

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
    return Provider(
      create: (_) => popupController,
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
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            ...widget.layers,
            const OSMMapZoomButtonsLayer(),
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
