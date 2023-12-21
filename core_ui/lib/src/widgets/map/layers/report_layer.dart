import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ReportLayer extends StatefulWidget {
  final ReportModel report;

  const ReportLayer({
    super.key,
    required this.report,
  });

  @override
  State<ReportLayer> createState() => _ReportLayerState();
}

class _ReportLayerState extends State<ReportLayer> {
  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [_reportToMarker(widget.report)],
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

  // TODO eliminate duplication
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
