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
    required this.onInformationTap,
  });

  final double width;
  final List<PublicReportDto> trashReports;
  final ValueChanged<bool> isHovering;
  final ValueChanged<bool> onReportTypeChange;
  final bool isShowDumps;
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
                  child: OSMMap(
                    initialZoom: 2,
                    layers: [
                      ClusteredReportsLayer(
                        reports: widget.trashReports,
                        onWidgetTap: (report) {
                          widget.onInformationTap(report.refId);
                        },
                      )
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
