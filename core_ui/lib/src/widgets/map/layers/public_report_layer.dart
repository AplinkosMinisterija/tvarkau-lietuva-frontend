import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PublicReportLayer extends StatefulWidget {
  final PublicReportDto report;

  const PublicReportLayer({
    super.key,
    required this.report,
  });

  @override
  State<PublicReportLayer> createState() => _PublicReportLayerState();
}

class _PublicReportLayerState extends State<PublicReportLayer> {
  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [_reportToMarker(widget.report)],
    );
  }

  Marker _reportToMarker(PublicReportDto report) {
    return Marker(
      key: ObjectKey(report),
      point: LatLng(report.latitude, report.longitude),
      width: 25,
      height: 30,
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
