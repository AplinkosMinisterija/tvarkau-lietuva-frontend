import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

typedef PopupBuilderType = Widget Function(BuildContext context, Marker marker);
typedef MarkerBuilderType<T> = Marker Function(T item);

class OSMMap<T> extends StatefulWidget {
  final LatLng? initialCenter;
  final double? initialZoom;
  final bool isMarkerClusteringEnabled;
  final List<T> items;
  final MarkerBuilderType<T> markerBuilder;
  final PopupBuilderType? popupBuilder;

  const OSMMap({
    super.key,
    required this.items,
    required this.markerBuilder,
    this.popupBuilder,
    this.initialCenter,
    this.initialZoom,
    this.isMarkerClusteringEnabled = true,
  });

  @override
  State<OSMMap> createState() => _OSMMapState<T>();
}

class _OSMMapState<T> extends State<OSMMap<T>> {
  static const _defaultInitialCenter = LatLng(55.1736, 23.8948);
  static const _defaultInitialZoom = 7.0;

  final PopupController _popupController = PopupController();
  late final markers =
      widget.items.map(widget.markerBuilder).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return PopupScope(
      popupController: _popupController,
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
            onTap: (_, __) {
              _popupController.hideAllPopups();
            }),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          widget.isMarkerClusteringEnabled
              ? _getMarkerClusterLayer()
              : _getMarkerLayer(),
          const OSMMapZoomButtons(),
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

  Widget _getMarkerLayer() {
    return PopupMarkerLayer(
      options: PopupMarkerLayerOptions(
        markers: markers,
        popupDisplayOptions: _getPopupDisplayOptions(),
      ),
    );
  }

  Widget _getMarkerClusterLayer() {
    return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        maxClusterRadius: 60,
        size: const Size(40, 40),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        forceIntegerZoomLevel: true,
        disableClusteringAtZoom: 12,
        markers: markers,
        popupOptions: _getPopupOptions(),
        builder: (context, markers) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
              child: Center(
                child: Text(
                  markers.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  PopupDisplayOptions? _getPopupDisplayOptions() {
    final popupBuilder = widget.popupBuilder;

    if (popupBuilder == null) {
      return null;
    } else {
      return PopupDisplayOptions(
        builder: popupBuilder,
      );
    }
  }

  PopupOptions? _getPopupOptions() {
    final popupBuilder = widget.popupBuilder;

    if (popupBuilder == null) {
      return null;
    } else {
      return PopupOptions(
        popupSnap: PopupSnap.markerTop,
        popupController: _popupController,
        popupBuilder: popupBuilder,
      );
    }
  }
}
