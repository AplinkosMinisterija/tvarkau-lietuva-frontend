import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainDumpMap extends StatefulWidget {
  const MainDumpMap({
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
  State<MainDumpMap> createState() => _MainDumpMapState();
}

class _MainDumpMapState extends State<MainDumpMap> {
  final CustomInfoWindowController _customDumpInfoWindowController =
      CustomInfoWindowController();
  BitmapDescriptor dumpMarkerIcon = BitmapDescriptor.defaultMarker;
  late bool isMapHover;

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
                        scrollGesturesEnabled: isMapHover ? false : true,
                        onMapCreated: (GoogleMapController controller) async {
                          _customDumpInfoWindowController.googleMapController =
                              controller;
                        },
                        onCameraMove: (position) {
                          _customDumpInfoWindowController.onCameraMove!();
                        },
                        onTap: (position) {
                          _customDumpInfoWindowController.hideInfoWindow!();
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
