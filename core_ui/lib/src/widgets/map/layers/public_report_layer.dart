import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class PublicReportLayer extends StatelessWidget {
  final PublicReportDto report;

  const PublicReportLayer({
    super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return SingleMarkerLayer(
      key: ObjectKey(report),
      width: 50,
      height: 50,
      point: LatLng(report.latitude, report.longitude),
      alignment: Alignment.bottomCenter,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: MarkerIconFactory.fromPublicReportDto(report),
      ),
    );
  }
}
