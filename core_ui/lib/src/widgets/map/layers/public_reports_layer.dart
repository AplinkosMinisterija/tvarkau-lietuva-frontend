import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class PublicReportsLayer extends StatefulWidget {
  final List<PublicReportDto> reports;
  final void Function(PublicReportDto item)? onWidgetTap;

  const PublicReportsLayer({
    super.key,
    required this.reports,
    this.onWidgetTap,
  });

  @override
  State<PublicReportsLayer> createState() => _PublicReportsLayerState();
}

class _PublicReportsLayerState extends State<PublicReportsLayer> {
  late final _markers =
      widget.reports.map(_reportToMarker).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return PopupMarkerLayer(
      options: PopupMarkerLayerOptions(
        markers: _markers,
        markerCenterAnimation: const MarkerCenterAnimation(),
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
        child: MarkerIconFactory.fromPublicReportDto(report),
      ),
    );
  }
}
