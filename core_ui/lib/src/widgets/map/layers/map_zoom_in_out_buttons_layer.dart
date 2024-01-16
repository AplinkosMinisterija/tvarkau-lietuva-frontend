import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class OSMMapZoomButtonsLayer extends StatelessWidget {
  final double minZoom;
  final double maxZoom;

  static const _fitBoundsPadding = EdgeInsets.all(12);

  const OSMMapZoomButtonsLayer({
    super.key,
    this.minZoom = 1,
    this.maxZoom = 18,
  });

  @override
  Widget build(BuildContext context) {
    final controller = MapController.of(context);
    final camera = MapCamera.of(context);

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: Colors.white70,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // TODO
                IconButton(
                  onPressed: () => print('Layers'),
                  icon: const Icon(Icons.layers),
                ),
                ToggleButtons(
                  direction: Axis.vertical,
                  onPressed: (int index) {
                    if (index == 0) {
                      final paddedMapCamera = CameraFit.bounds(
                        bounds: camera.visibleBounds,
                        padding: _fitBoundsPadding,
                      ).fit(camera);
                      final zoom = min(paddedMapCamera.zoom + 1, maxZoom);
                      controller.move(paddedMapCamera.center, zoom);
                    } else {
                      final paddedMapCamera = CameraFit.bounds(
                        bounds: camera.visibleBounds,
                        padding: _fitBoundsPadding,
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
              ],
            )),
      ),
    );
  }
}
