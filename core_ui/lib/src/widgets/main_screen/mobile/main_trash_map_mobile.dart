import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainTrashMapMobile extends StatefulWidget {
  const MainTrashMapMobile({
    super.key,
    required this.width,
    required this.trashReports,
    required this.isHovering,
    required this.onReportTypeChange,
    required this.isShowDumps,
    required this.isTrash,
    required this.onInformationTap,
  });

  final double width;
  final List<PublicReportDto> trashReports;
  final ValueChanged<bool> isHovering;
  final ValueChanged<bool> onReportTypeChange;
  final bool isShowDumps;
  final bool isTrash;

  final Function(String) onInformationTap;

  @override
  State<MainTrashMapMobile> createState() => _MainTrashMapMobileState();
}

class _MainTrashMapMobileState extends State<MainTrashMapMobile> {
  final CustomInfoWindowController _customTrashInfoWindowController =
      CustomInfoWindowController();
  BitmapDescriptor trashMarkerIcon = BitmapDescriptor.defaultMarker;
  bool isShowMarkers = false;
  bool isShowDumps = true;
  bool isMapDisabled = false;

  late final markersLayer = AppMapMarkersLayer.fromPublicReports(
    widget.trashReports,
    onTap: _onMarkerTap,
  );

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
                          markersLayer: markersLayer,
                          onMapCreated: (GoogleMapController controller) async {
                            _customTrashInfoWindowController
                                .googleMapController = controller;
                          },
                          onCameraMove: (position) {
                            _customTrashInfoWindowController.onCameraMove!();
                          },
                          onTap: isMapDisabled
                              ? (position) {}
                              : (position) {
                                  _customTrashInfoWindowController
                                      .hideInfoWindow!();
                                },
                        ),
                        CustomInfoWindow(
                          (top, left, width, height) => {},
                          leftMargin: 200,
                          controller: _customTrashInfoWindowController,
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
            widget.isTrash
                ? Padding(
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
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  void _onMarkerTap(PublicReportDto report) {
    _customTrashInfoWindowController.addInfoWindow!(
      InfoTrashWindowBox(
          title: report.name,
          imageUrls: report.imageUrls.toList(),
          status: report.status,
          date: report.reportDate.toString(),
          reportId: report.refId,
          onTap: () {
            widget.onInformationTap(report.refId);
          }),
      LatLng(
        report.latitude.toDouble(),
        report.longitude.toDouble(),
      ),
    );
  }
}
