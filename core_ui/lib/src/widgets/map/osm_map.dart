import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

typedef MapTapCallback = void Function(LatLng position);

class OSMMap extends StatefulWidget {
  final LatLng? initialCenter;
  final double? initialZoom;
  final List<Widget> layers;
  final PopupController? popupController;
  final MapTapCallback? onTap;

  const OSMMap({
    super.key,
    required this.layers,
    this.initialCenter,
    this.initialZoom,
    this.popupController,
    this.onTap,
  });

  @override
  State<OSMMap> createState() => _OSMMapState();
}

class _OSMMapState extends State<OSMMap> {
  static const _defaultInitialCenter = LatLng(55.1736, 23.8948);
  static const _defaultInitialZoom = 7.0;

  final PopupController _popupController = PopupController();

  @override
  Widget build(BuildContext context) {
    return PopupScope(
      popupController: widget.popupController ?? _popupController,
      child: FlutterMap(
        options: MapOptions(
            initialZoom: widget.initialZoom ?? _defaultInitialZoom,
            initialCenter: widget.initialCenter ?? _defaultInitialCenter,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              enableScrollWheel: false,
            ),
            minZoom: 6,
            maxZoom: 19,
            // Hide popup when the map is tapped.
            onTap: (_, position) {
              final onTap = widget.onTap;
              if (onTap != null) {
                onTap(position);
              } else {
                _popupController.hideAllPopups();
              }
            }),
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
    );
  }
}
