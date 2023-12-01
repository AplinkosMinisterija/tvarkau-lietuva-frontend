import 'package:core_ui/core_ui.dart';
import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'information_window/custom_info_window.dart';

class MainDumpMap extends StatefulWidget {
  const MainDumpMap({
    required this.width,
    required this.dumpReports,
    required this.isHovering,
    required this.onReportTypeChange,
    required this.isShowDumps,
  });

  final double width;
  final List<ReportModel> dumpReports;
  final ValueChanged<bool> isHovering;
  final ValueChanged<bool> onReportTypeChange;
  final bool isShowDumps;

  @override
  State<MainDumpMap> createState() => _MainDumpMapState();
}

class _MainDumpMapState extends State<MainDumpMap> {
  final CustomInfoWindowController _customDumpInfoWindowController =
      CustomInfoWindowController();
  Set<Marker> dumpMarkers = {};
  Set<Marker> _dumpMarkers = {};
  late bool isMapHover;

  @override
  void initState() {
    isMapHover = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        widget.isHovering(true);
      }),
      onExit: (_) => setState(() {
        widget.isHovering(false);
      }),
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: widget.width * 0.354,
                width: widget.width * 0.625,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                  child: OSMMap<ReportModel>(
                    items: widget.dumpReports,
                    isMarkerClusteringEnabled: false,
                    popupBuilder: (context, marker) {
                      final dump =
                          (marker.key as ObjectKey).value as ReportModel;

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
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: ReportTypeSwitcher(
                width: widget.width,
                isShowDumps: widget.isShowDumps,
                onReportTypeChange: (bool value) {
                  widget.onReportTypeChange(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
