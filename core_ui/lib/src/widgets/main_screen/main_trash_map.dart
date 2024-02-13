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
  BitmapDescriptor trashMarkerIcon = BitmapDescriptor.defaultMarker;
  bool isShowMarkers = false;
  bool isShowDumps = true;
  Set<Marker> trashMarkers = {};
  Set<Marker> _trashMarkers = {};

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
              element.latitude.toDouble(),
              element.longitude.toDouble(),
            ),
            icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(size: Size(25, 30)),
                getTrashIconPath(element.status)),
            onTap: () {
              _customTrashInfoWindowController.addInfoWindow!(
                InfoTrashWindowBox(
                    title: element.name,
                    imageUrls: element.imageUrls.toList(),
                    status: element.status,
                    date: element.reportDate.toString(),
                    reportId: element.refId,
                    onTap: () {
                      widget.onInformationTap(element.refId);
                    }),
                LatLng(
                  element.latitude.toDouble(),
                  element.longitude.toDouble(),
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
                        mapType: _currentMapType,
                        initialCameraPosition: _lithuaniaCameraPosition,
                        markers: _trashMarkers,
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        onMapCreated: (GoogleMapController controller) async {
                          _customTrashInfoWindowController.googleMapController =
                              controller;
                        },
                        onCameraMove: (position) {
                          _customTrashInfoWindowController.onCameraMove!();
                        },
                        onTap: (position) {
                          _customTrashInfoWindowController.hideInfoWindow!();
                        },
                      ),
                      CustomInfoWindow(
                        (top, left, width, height) => {},
                        leftMargin: 200,
                        controller: _customTrashInfoWindowController,
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
          widget.isTrash
              ? Padding(
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
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  String getTrashIconPath(String status) {
    if (status == "gautas") {
      return 'assets/icons/marker_pins/red_marker.png';
    } else if (status == "tiriamas") {
      return 'assets/icons/marker_pins/orange_marker.png';
    } else if (status == "išspręsta") {
      return 'assets/icons/marker_pins/blue_marker.png';
    } else if (status == "nepasitvirtino") {
      return 'assets/icons/marker_pins/gray_marker.png';
    } else {
      return 'assets/icons/marker_pins/red_marker.png';
    }
  }
}
