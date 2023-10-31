import 'package:auto_size_text/auto_size_text.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:domain/domain.dart';
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
  BitmapDescriptor dumpMarkerIcon = BitmapDescriptor.defaultMarker;
  Set<Marker> dumpMarkers = {};
  Set<Marker> _dumpMarkers = {};
  late bool isMapHover;

  voidAddDumpMarkers() {
    int index = 1000;
    Set<Marker> tempDumpMarkers = {};
    widget.dumpReports.forEach(
      (element) async {
        tempDumpMarkers.add(
          Marker(
              markerId: MarkerId(
                element.name.toString() + index.toString(),
              ),
              position: LatLng(
                element.reportLat,
                element.reportLong,
              ),
              icon: await BitmapDescriptor.fromAssetImage(
                  const ImageConfiguration(size: Size(50, 50)),
                  'assets/svg/dump_icon.svg'),
              onTap: () {
                _customDumpInfoWindowController.addInfoWindow!(
                  InfoDumpWindowBox(
                    title: element.name ?? '',
                    address: element.address ?? '',
                    phone: element.phone ?? '',
                    workingHours: element.workingHours ?? '',
                    moreInformation: element.moreInformation ?? '',
                    isHovering: (bool value) {
                      setState(() {
                        isMapHover = value;
                      });
                    },
                  ),
                  LatLng(
                    element.reportLat,
                    element.reportLong,
                  ),
                );
              }),
        );
        index++;
      },
    );
    setState(() {
      _dumpMarkers = tempDumpMarkers;
    });
  }

  late MapType _currentMapType;
  final CameraPosition _lithuaniaCameraPosition =
      const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0);

  @override
  void initState() {
    isMapHover = false;
    _currentMapType = MapType.normal;
    voidAddDumpMarkers();
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
                      GoogleMap(
                        scrollGesturesEnabled: isMapHover ? false : true,
                        mapType: _currentMapType,
                        initialCameraPosition: _lithuaniaCameraPosition,
                        markers: _dumpMarkers,
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 110, right: 10),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: GoogleMapTypeButton(
                              height: 40,
                              width: 40,
                              onPressed: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        MapTypeChangeDialog(
                                            width: widget.width / 2.4,
                                            currentMapType: _currentMapType,
                                            onHover: (isHover) {},
                                            onChangeTap: (MapType mapType) {
                                              setState(() {
                                                _currentMapType = mapType;
                                              });
                                            }));
                              },
                            )),
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
