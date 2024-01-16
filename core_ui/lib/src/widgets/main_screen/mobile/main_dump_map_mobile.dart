import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MainDumpMapMobile extends StatefulWidget {
  const MainDumpMapMobile({
    super.key,
    required this.width,
    required this.dumpReports,
    required this.isHovering,
    required this.onReportTypeChange,
    required this.isShowDumps,
  });

  final double width;
  final List<DumpDto> dumpReports;
  final ValueChanged<bool> isHovering;
  final ValueChanged<bool> onReportTypeChange;
  final bool isShowDumps;

  @override
  State<MainDumpMapMobile> createState() => _MainDumpMapMobileState();
}

class _MainDumpMapMobileState extends State<MainDumpMapMobile> {
  late bool isMapHover;

  @override
  void initState() {
    isMapHover = false;
    super.initState();
  }

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
                      enableScrollWheel: !isMapHover,
                      layers: [
                        DumpsLayer(
                          dumps: widget.dumpReports,
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
