import 'package:core_ui/core_ui.dart';
import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DumpsMap extends StatelessWidget {
  final List<ReportModel> dumps;

  const DumpsMap({super.key, required this.dumps});

  @override
  Widget build(BuildContext context) {
    return OSMMap<ReportModel>(
      items: dumps,
      isMarkerClusteringEnabled: false,
      popupBuilder: (context, marker) {
        final dump = (marker.key as ObjectKey).value as ReportModel;

        return InfoDumpWindowBox(
          title: dump.name ?? '',
          address: dump.address ?? '',
          phone: dump.phone ?? '',
          workingHours: dump.workingHours ?? '',
          moreInformation: dump.moreInformation ?? '',
          isHovering: (bool value) {},
        );
      },
      markerBuilder: (dump) {
        return Marker(
          key: ObjectKey(dump),
          point: LatLng(
            dump.reportLat,
            dump.reportLong,
          ),
          width: 50,
          height: 50,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            // TODO replace with SVG
            child: Image.asset(
              // 'assets/svg/dump_icon.svg',
              'assets/icons/marker_pins/red_marker.png',
              key: const Key('dump-icon'),
            ),
          ),
        );
      },
    );
  }
}
