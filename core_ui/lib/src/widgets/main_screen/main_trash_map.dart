import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MainTrashMap extends StatefulWidget {
  const MainTrashMap({
    super.key,
    required this.width,
    required this.trashReports,
    required this.isHovering,
    required this.onReportTypeChange,
    required this.isShowDumps,
    required this.onInformationTap,
  });

  final double width;
  final List<PublicReportDto> trashReports;
  final ValueChanged<bool> isHovering;
  final ValueChanged<bool> onReportTypeChange;
  final bool isShowDumps;
  final Function(String) onInformationTap;

  @override
  State<MainTrashMap> createState() => _MainTrashMapState();
}

class _MainTrashMapState extends State<MainTrashMap> {
  bool isShowMarkers = false;

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
                  child: OSMMap(
                    initialZoom: 2,
                    layers: [
                      ClusteredReportsLayer(
                        reports: widget.trashReports,
                        onWidgetTap: (report) {
                          widget.onInformationTap(report.refId);
                        },
                      )
                    ],
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
