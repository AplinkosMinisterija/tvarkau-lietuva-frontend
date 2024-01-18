import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullReportsLayer extends StatefulWidget {
  final List<FullReportDto> reports;
  final Function(FullReportDto dump)? onTap;

  const FullReportsLayer({
    super.key,
    required this.reports,
    this.onTap,
  });

  @override
  State<FullReportsLayer> createState() => _FullReportsLayerState();
}

class _FullReportsLayerState extends State<FullReportsLayer> {
  late final _markers =
      widget.reports.map(_reportsToMarker).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(markers: _markers);
  }

  Marker _reportsToMarker(FullReportDto report) {
    return Marker(
      key: ObjectKey(report),
      point: LatLng(report.latitude, report.longitude),
      width: 50,
      height: 50,
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: widget.onTap != null ? () => widget.onTap!(report) : null,
        child: MarkerIconFactory.fromFullReport(report),
      ),
    );
  }
}
