import 'dart:math';

import 'package:core_ui/src/widgets/map/osm_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

class OSMMapButtonsLayer extends StatelessWidget {
  final OSMMapType osmMapType;
  final double minZoom;
  final double maxZoom;

  static const _fitBoundsPadding = EdgeInsets.all(12);

  const OSMMapButtonsLayer({
    super.key,
    required this.osmMapType,
    this.minZoom = 1,
    this.maxZoom = 18,
  });

  Widget build(BuildContext context) {
    final controller = MapController.of(context);
    final camera = MapCamera.of(context);

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.white,
              child: IconButton(
                onPressed: () => _onMapTypeChangeTap(context),
                icon: const Icon(Icons.map),
                selectedIcon: const Icon(Icons.satellite),
                isSelected: osmMapType == OSMMapType.osm,
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),
              child: ToggleButtons(
                direction: Axis.vertical,
                onPressed: (int index) {
                  if (index == 0) {
                    final paddedMapCamera = CameraFit.bounds(
                      bounds: camera.visibleBounds,
                      padding: OSMMapButtonsLayer._fitBoundsPadding,
                    ).fit(camera);
                    final zoom = min(paddedMapCamera.zoom + 1, maxZoom);
                    controller.move(paddedMapCamera.center, zoom);
                  } else {
                    final paddedMapCamera = CameraFit.bounds(
                      bounds: camera.visibleBounds,
                      padding: OSMMapButtonsLayer._fitBoundsPadding,
                    ).fit(camera);
                    var zoom = paddedMapCamera.zoom - 1;
                    if (zoom < minZoom) {
                      zoom = minZoom;
                    }
                    controller.move(paddedMapCamera.center, zoom);
                  }
                },
                color: Colors.black,
                isSelected: const [false, false],
                children: const [
                  Icon(Icons.zoom_in),
                  Icon(Icons.zoom_out),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMapTypeChangeTap(BuildContext context) {
    context.read<OSMMapTypeProvider>().mapType =
        osmMapType == OSMMapType.osm ? OSMMapType.satellite : OSMMapType.osm;
  }
}
