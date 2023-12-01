import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class ReportMap extends StatelessWidget {
  final ReportModel report;

  const ReportMap({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return ReportsMap(
      reports: [report],
      isMarkerClusteringEnabled: false,
      initialZoom: 14,
      initialCenter: LatLng(report.reportLat, report.reportLong),
      onPopupTap: null,
    );
  }
}
