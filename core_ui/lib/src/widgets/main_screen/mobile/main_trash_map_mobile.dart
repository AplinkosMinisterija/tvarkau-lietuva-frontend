import 'package:core_ui/core_ui.dart';
import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';

class MainTrashMapMobile extends StatefulWidget {
  const MainTrashMapMobile({
    required this.width,
    required this.trashReports,
    required this.isHovering,
    required this.onReportTypeChange,
    required this.isShowDumps,
    required this.onInformationTap,
  });

  final double width;
  final List<ReportModel> trashReports;
  final ValueChanged<bool> isHovering;
  final ValueChanged<bool> onReportTypeChange;
  final bool isShowDumps;
  final Function(String) onInformationTap;

  @override
  State<MainTrashMapMobile> createState() => _MainTrashMapMobileState();
}

class _MainTrashMapMobileState extends State<MainTrashMapMobile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (_) => setState(() {
        widget.isHovering(true);
      }),
      onHorizontalDragEnd: (_) => setState(() {
        widget.isHovering(false);
      }),
      onVerticalDragStart: (_) => setState(() {
        widget.isHovering(true);
      }),
      onVerticalDragEnd: (_) => setState(() {
        widget.isHovering(false);
      }),
      child: MouseRegion(
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
                  height: widget.width * 1.722,
                  width: widget.width * 0.911,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: OSMMap(
                      layers: [
                        ClusteredReportsLayer(
                          reports: widget.trashReports,
                          onTap: (report) {
                            widget.onInformationTap(report.refId ?? '1');
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.width * 0.0135,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.width * 0.022),
              child: Align(
                alignment: Alignment.topCenter,
                child: ReportTypeSwitcherMobile(
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
      ),
    );
  }
}
