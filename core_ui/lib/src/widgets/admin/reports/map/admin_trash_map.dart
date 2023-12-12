import 'package:auto_size_text/auto_size_text.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/admin/reports/map/admin_trash_window_box.dart';
import 'package:domain/report/report_library.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:domain/domain.dart';

class AdminTrashMap extends StatefulWidget {
  const AdminTrashMap({
    super.key,
    required this.width,
    required this.trashReports,
    required this.isHovering,
    required this.onUpdate,
  });

  final double width;
  final List<ReportModel> trashReports;
  final ValueChanged<bool> isHovering;
  final Function(ReportModel, List<http.MultipartFile>) onUpdate;

  @override
  State<AdminTrashMap> createState() => _AdminTrashMapState();
}

class _AdminTrashMapState extends State<AdminTrashMap> {
  final CustomInfoWindowController _customTrashInfoWindowController =
      CustomInfoWindowController();
  BitmapDescriptor trashMarkerIcon = BitmapDescriptor.defaultMarker;
  bool isShowMarkers = false;
  bool isShowDumps = true;
  Set<Marker> trashMarkers = {};
  final Set<Marker> _trashMarkers = {};

  Future<void> voidAddTrashMarkers() async {
    int index = 0;
    for (var element in widget.trashReports) {
      _trashMarkers.add(
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
                AdminTrashWindowBox(
                  title: element.name,
                  imageUrls: element.imageUrls,
                  status: element.status,
                  onUpdate: (updatedModel, officerFiles) {
                    widget.onUpdate(updatedModel, officerFiles);
                  },
                  report: element,
                  screenWidth: widget.width,
                ),
                LatLng(
                  element.reportLat,
                  element.reportLong,
                ),
              );
            }),
      );
      index++;
    }
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
    return Column(
      children: <Widget>[
        SizedBox(
          height: widget.width * 0.354,
          width: widget.width * 0.725,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: [
                MouseRegion(
                  onEnter: (_) => setState(() {
                    widget.isHovering(true);
                  }),
                  onExit: (_) => setState(() {
                    widget.isHovering(false);
                  }),
                  child: GoogleMap(
                    mapType: _currentMapType,
                    initialCameraPosition: _lithuaniaCameraPosition,
                    markers: _trashMarkers,
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
                ),
                CustomInfoWindow(
                  (top, left, width, height) => {},
                  leftMargin: 200,
                  controller: _customTrashInfoWindowController,
                  isDump: false,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: widget.width * 0.0135,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText(
                'Pasirinkite žemėlapio tipą:',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: widget.width * 0.0083),
              MapTypeSwitcher(
                width: widget.width,
                onMapTypeChange: (MapType value) {
                  setState(() {
                    _currentMapType = value;
                  });
                },
                currentMapType: _currentMapType,
              )
            ],
          ),
        ),
      ],
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
