import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ReportsMap extends StatelessWidget {
  final List<ReportModel> reports;
  final void Function(ReportModel item)? onPopupTap;
  final LatLng? initialCenter;
  final double? initialZoom;
  final bool isMarkerClusteringEnabled;

  const ReportsMap({
    super.key,
    required this.reports,
    required this.onPopupTap,
    this.isMarkerClusteringEnabled = true,
    this.initialCenter,
    this.initialZoom,
  });

  @override
  Widget build(BuildContext context) {
    return OSMMap<ReportModel>(
      items: reports,
      initialCenter: initialCenter,
      initialZoom: initialZoom,
      isMarkerClusteringEnabled: isMarkerClusteringEnabled,
      markerBuilder: (report) {
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
      },
      popupBuilder: _getPopupBuilder(),
    );
  }

  PopupBuilderType? _getPopupBuilder() {
    final onPopupTapLocal = onPopupTap;

    if (onPopupTapLocal == null) {
      return null;
    }

    return (context, marker) {
      final report = (marker.key as ObjectKey).value as ReportModel;

      return InfoTrashWindowBox(
        title: report.name ?? '',
        imageUrls: report.imageUrls ?? [],
        status: report.status,
        date: report.reportDate,
        reportId: report.refId ?? '',
        onTap: () => onPopupTapLocal(report),
      );
    };
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
