import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class ClusteredReportsLayer extends StatefulWidget {
  final List<PublicReportDto> reports;
  final void Function(PublicReportDto item)? onWidgetTap;

  const ClusteredReportsLayer({
    super.key,
    required this.reports,
    this.onWidgetTap,
  });

  @override
  State<ClusteredReportsLayer> createState() => _ClusteredReportsLayerState();
}

class _ClusteredReportsLayerState extends State<ClusteredReportsLayer> {
  late final _markers =
      widget.reports.map(_reportToMarker).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return PopupMarkerLayer(
      options: PopupMarkerLayerOptions(
        markers: _markers,
        popupController: context.read<PopupController>(),
        popupDisplayOptions: PopupDisplayOptions(
          snap: PopupSnap.markerTop,
          builder: (context, marker) {
            final report = (marker.key as ObjectKey).value as PublicReportDto;
            final onWidgetTap = widget.onWidgetTap;

            return InfoTrashWindowBox(
              title: report.name,
              imageUrls: report.imageUrls.toList(),
              status: report.status,
              // TODO remove toString
              date: report.reportDate.toString(),
              reportId: report.refId,
              onTap: () {
                if (onWidgetTap != null) {
                  onWidgetTap(report);
                }
              },
            );
          },
        ),
      ),
    );

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
          popupController: context.read<PopupController>(),
          popupBuilder: (context, marker) {
            final report = (marker.key as ObjectKey).value as PublicReportDto;
            final onWidgetTap = widget.onWidgetTap;

            return InfoTrashWindowBox(
              title: report.name,
              imageUrls: report.imageUrls.toList(),
              status: report.status,
              // TODO remove toString
              date: report.reportDate.toString(),
              reportId: report.refId,
              onTap: () {
                if (onWidgetTap != null) {
                  onWidgetTap(report);
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

  Marker _reportToMarker(PublicReportDto report) {
    return Marker(
      key: ObjectKey(report),
      point: LatLng(report.latitude, report.longitude),
      width: 25,
      height: 30,
      alignment: Alignment.bottomCenter,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Image.asset(
          report.mapIconPath,
          key: Key('trash-icon-${report.status}'),
        ),
      ),
    );
  }
}
