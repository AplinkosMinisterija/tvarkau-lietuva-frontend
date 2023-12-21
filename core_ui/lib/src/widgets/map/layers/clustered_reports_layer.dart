import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class ClusteredReportsLayer extends StatefulWidget {
  final List<ReportModel> reports;
  final void Function(ReportModel item)? onTap;

  const ClusteredReportsLayer({
    super.key,
    required this.reports,
    this.onTap,
  });

  @override
  State<ClusteredReportsLayer> createState() => _ClusteredReportsLayerState();
}

class _ClusteredReportsLayerState extends State<ClusteredReportsLayer> {
  final PopupController _popupController = PopupController();

  late final _markers =
      widget.reports.map(_reportToMarker).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        maxClusterRadius: 60,
        size: const Size(40, 40),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        forceIntegerZoomLevel: true,
        disableClusteringAtZoom: 12,
        markers: _markers,
        popupOptions: PopupOptions(
          popupSnap: PopupSnap.markerTop,
          popupController: _popupController,
          popupBuilder: (context, marker) {
            final report = (marker.key as ObjectKey).value as ReportModel;
            final onTap = widget.onTap;

            return InfoTrashWindowBox(
              title: report.name,
              imageUrls: report.imageUrls ?? [],
              status: report.status,
              date: report.reportDate,
              reportId: report.refId ?? '',
              onTap: () {
                if (onTap != null) {
                  onTap(report);
                }
              },
            );
          },
        ),
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

  Marker _reportToMarker(ReportModel report) {
    return Marker(
      key: ObjectKey(report),
      point: LatLng(report.reportLat, report.reportLong),
      width: 25,
      height: 30,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Image.asset(
          _getTrashIconPath(report.status),
          key: Key('trash-icon-${report.status}'),
        ),
      ),
    );
  }

  String _getTrashIconPath(String status) {
    if (status == "gautas") {
      return 'assets/icons/marker_pins/red_marker.png';
    } else if (status == "tiriamas") {
      return 'assets/icons/marker_pins/orange_marker.png';
    } else if (status == "ištirtas") {
      return 'assets/icons/marker_pins/blue_marker.png';
    } else if (status == "nepasitvirtino") {
      return 'assets/icons/marker_pins/gray_marker.png';
    } else if (status == "sutvarkyta") {
      return 'assets/icons/marker_pins/green_marker.png';
    } else {
      return 'assets/icons/marker_pins/red_marker.png';
    }
  }
}
