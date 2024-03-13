import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final CustomInfoWindowController _customDumpInfoWindowController =
      CustomInfoWindowController();
  late bool isMapHover;
  bool isMapDisabled = false;

  late final markersLayer = AppMapMarkersLayer.fromDumps(
    widget.dumpReports,
    onTap: _onMarkerTap,
  );

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
                    child: Stack(
                      children: [
                        AppMap(
                          scrollGesturesEnabled: isMapHover ? false : true,
                          markersLayer: markersLayer,
                          onMapCreated: (GoogleMapController controller) async {
                            _customDumpInfoWindowController
                                .googleMapController = controller;
                          },
                          onCameraMove: (position) {
                            _customDumpInfoWindowController.onCameraMove!();
                          },
                          onTap: isMapDisabled
                              ? (position) {}
                              : (position) {
                                  _customDumpInfoWindowController
                                      .hideInfoWindow!();
                                },
                        ),
                        CustomInfoWindow(
                          (top, left, width, height) => {},
                          leftMargin: 325,
                          offset: 100,
                          controller: _customDumpInfoWindowController,
                          isDump: widget.isShowDumps,
                        ),
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

  void _onMarkerTap(DumpDto dump) {
    _customDumpInfoWindowController.addInfoWindow!(
      InfoDumpWindowBox(
        title: dump.name,
        address: dump.address ?? '',
        phone: dump.phone ?? '',
        workingHours: dump.workingHours,
        moreInformation: dump.moreInformation,
        isHovering: (bool value) {
          setState(() {
            isMapHover = value;
          });
        },
      ),
      LatLng(
        dump.reportLat.toDouble(),
        dump.reportLong.toDouble(),
      ),
    );
  }
}
