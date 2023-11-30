import 'package:core_ui/core_ui.dart';
import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:domain/domain.dart';

class MainTrashMapMobile extends StatefulWidget {
  const MainTrashMapMobile({
    super.key,
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
  final CustomInfoWindowController _customTrashInfoWindowController =
      CustomInfoWindowController();
  BitmapDescriptor trashMarkerIcon = BitmapDescriptor.defaultMarker;
  bool isShowMarkers = false;
  bool isShowDumps = true;
  Set<Marker> trashMarkers = {};
  Set<Marker> _trashMarkers = {};
  bool isMapDisabled = false;

  Future<void> voidAddTrashMarkers() async {
    int index = 0;
    Set<Marker> tempMarkers = {};
    for (var element in widget.trashReports) {
      tempMarkers.add(
        Marker(
            markerId: MarkerId(
              element.name.toString() + index.toString(),
            ),
            position: LatLng(
              element.reportLat,
              element.reportLong,
            ),
            icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(size: Size(25, 30)),
                getTrashIconPath(element.status)),
            onTap: () {
              _customTrashInfoWindowController.addInfoWindow!(
                InfoTrashWindowBox(
                    title: element.name,
                    imageUrls: element.imageUrls ?? [],
                    status: element.status,
                    date: element.reportDate,
                    reportId: element.refId ?? '',
                    onTap: () {
                      widget.onInformationTap(element.refId ?? '1');
                    }),
                LatLng(
                  element.reportLat,
                  element.reportLong,
                ),
              );
            }),
      );
      index++;
    }
    setState(() {
      _trashMarkers = tempMarkers;
    });
  }

  late MapType _currentMapType;
  final CameraPosition _lithuaniaCameraPosition =
      const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0);

  @override
  void initState() {
    voidAddTrashMarkers();
    _currentMapType = MapType.normal;
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
                          mapType: _currentMapType,
                          initialCameraPosition: _lithuaniaCameraPosition,
                          markers: _trashMarkers,
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

  String getTrashIconPath(String status) {
    if (status == "gautas") {
      return 'assets/icons/marker_pins/red_marker.png';
    } else if (status == "tiriamas") {
      return 'assets/icons/marker_pins/orange_marker.png';
    } else if (status == "ištirtas") {
      return 'assets/icons/marker_pins/blue_marker.png';
    } else if (status == "nepasitvirtino") {
      return 'assets/icons/marker_pins/gray_marker.png';
    } else if (status == "sutvarkyta") {
      return 'assets/icons/marker_pins/green_marker.png';
    } else {
      return 'assets/icons/marker_pins/red_marker.png';
    }
  }
}
