import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainTrashMap extends StatefulWidget {
  const MainTrashMap({
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
  State<MainTrashMap> createState() => _MainTrashMapState();
}

class _MainTrashMapState extends State<MainTrashMap> {
  final CustomInfoWindowController _customTrashInfoWindowController =
      CustomInfoWindowController();
  bool isShowMarkers = false;
  bool isShowDumps = true;

  late final markersLayer = AppMapMarkersLayer.fromPublicReports(
    widget.trashReports,
    onTap: _onMarkerTap,
  );

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
                  child: Stack(
                    children: [
                      AppMap(
                        markersLayer: markersLayer,
                        onCameraMove: (position) {
                          _customTrashInfoWindowController.onCameraMove!();
                        },
                        onTap: (position) {
                          _customTrashInfoWindowController.hideInfoWindow!();
                        },
                        onMapCreated: (GoogleMapController controller) async {
                          _customTrashInfoWindowController.googleMapController =
                              controller;
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
            ],
          ),
          widget.isTrash
              ? Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ReportTypeSwitcher(
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
    );
  }

  void _onMarkerTap(PublicReportDto report) {
    print('OnTap $report');
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
      LatLng(report.latitude, report.longitude),
    );
  }

  @override
  void dispose() {
    _customTrashInfoWindowController.dispose();

    super.dispose();
  }
}
