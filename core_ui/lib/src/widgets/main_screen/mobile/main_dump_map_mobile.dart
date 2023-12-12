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
  BitmapDescriptor dumpMarkerIcon = BitmapDescriptor.defaultMarker;
  Set<Marker> dumpMarkers = {};
  Set<Marker> _dumpMarkers = {};
  late bool isMapHover;
  bool isMapDisabled = false;

  voidAddDumpMarkers() async {
    int index = 1000;
    Set<Marker> tempDumpMarkers = {};
    for (var element in widget.dumpReports) {
      tempDumpMarkers.add(
        Marker(
            markerId: MarkerId(
              element.name.toString() + index.toString(),
            ),
            position: LatLng(
              element.reportLat.toDouble(),
              element.reportLong.toDouble(),
            ),
            icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(size: Size(50, 50)),
                'assets/svg/dump_icon.svg'),
            onTap: () {
              _customDumpInfoWindowController.addInfoWindow!(
                InfoDumpWindowBox(
                  title: element.name,
                  address: element.address ?? '',
                  phone: element.phone ?? '',
                  workingHours: element.workingHours,
                  moreInformation: element.moreInformation,
                  isHovering: (bool value) {
                    setState(() {
                      isMapHover = value;
                    });
                  },
                ),
                LatLng(
                  element.reportLat.toDouble(),
                  element.reportLong.toDouble(),
                ),
              );
            }),
      );
      index++;
    }

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
                        GoogleMap(
                          scrollGesturesEnabled: isMapHover ? false : true,
                          mapType: _currentMapType,
                          initialCameraPosition: _lithuaniaCameraPosition,
                          markers: _dumpMarkers,
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
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 110, right: 10),
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
                                              width: widget.width,
                                              currentMapType: _currentMapType,
                                              onHover: (isHover) {
                                                setState(() {
                                                  isMapDisabled = isHover;
                                                });
                                              },
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
