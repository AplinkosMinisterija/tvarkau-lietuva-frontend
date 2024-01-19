import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map_marker_popup/extension_api.dart';

class ClusteredMapLayer extends StatelessWidget {
  final List<Marker> markers;
  final PopupBuilder popupBuilder;

  const ClusteredMapLayer({
    super.key,
    required this.markers,
    required this.popupBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        maxClusterRadius: 45,
        centerMarkerOnClick: true,
        size: const Size(40, 40),
        disableClusteringAtZoom: 5,
        markers: markers,
        popupOptions: PopupOptions(
          popupController: context.read<PopupController>(),
          markerTapBehavior: MarkerTapBehavior.togglePopupAndHideRest(),
          popupBuilder: popupBuilder,
        ),
        builder: (context, markers) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primary,
              ),
              child: Center(
                child: Text(
                  markers.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
