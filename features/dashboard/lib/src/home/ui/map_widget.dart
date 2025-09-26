import 'dart:async';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:api_client/api_client.dart';
import 'package:core/utils/secure_storage_provider.dart';
import 'package:dashboard/src/home/ui/tile_providers.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter_map_marker_cluster_2/flutter_map_marker_cluster.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:latlong2/latlong.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong;

class MapWidget extends StatefulWidget {
  const MapWidget({
    required this.width,
    this.reports,
    this.dumps,
    this.reportStatistics,
    required this.isHovering,
    required this.cameraPosition,
    required this.onCategoryChange,
    required this.category,
    this.onInformationTap,
    this.onError,
    required this.isMobile,
    super.key,
  });

  final double width;
  final List<PublicReportDto>? reports;
  final List<DumpDto>? dumps;
  final ReportStatisticsDto? reportStatistics;
  final ValueChanged<bool> isHovering;
  final gmaps.CameraPosition cameraPosition;
  final Function(String) onCategoryChange;
  final Function(String)? onInformationTap;
  final void Function(Exception e)? onError;
  final String category;
  final bool isMobile;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with TickerProviderStateMixin {
  double? selectedLat;
  double? selectedLong;
  double selectedZoom = 7;

  bool isShowMarkers = false;
  bool isShowDumps = false;
  List<Marker> _markers = [];
  late bool isMapHover;
  bool isTrash = false;
  String? initialItem;
  LatLng initPosition = const LatLng(55, 24);
  late void Function(Exception e) onError;
  MapController mapController = MapController();

  bool isLocationLoading = false;
  late AnimationController _animationController;

  static const List<String> _dropdownList = [
    'Atliekos',
    'Sugadinta miško paklotė ir keliai',
    'Pažeidimai kirtimuose',
  ];

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      const error = PermissionDeniedException("Vietos aptikimas uždraustas");
      onError(error);
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(error);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      const error =
          PermissionDeniedException("Vietos aptikimas uždraustas amžinai");
      onError(error);
      return Future.error(error);
    }
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      while (!await Geolocator.isLocationServiceEnabled()) {}
    }
    return await Geolocator.getCurrentPosition();
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    final latTween = Tween<double>(
        begin: mapController.camera.center.latitude,
        end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.camera.center.longitude,
        end: destLocation.longitude);
    final zoomTween =
        Tween<double>(begin: mapController.camera.zoom, end: destZoom);
    if (mounted) {
      _animationController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );
    }
    final Animation<double> animation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);

    _animationController.addListener(() {
      mapController.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });

    if (mounted) {
      _animationController.forward();
    }
  }

  @override
  void initState() {
    onError = widget.onError ?? (e) => debugPrint(e.toString());
    mapMarkers();
    mapController = MapController();

    if (widget.category == 'trash' || widget.category == 'dumps') {
      initialItem = 'Atliekos';
    } else if (widget.category == 'forest') {
      initialItem = 'Sugadinta miško paklotė ir keliai';
    } else if (widget.category == 'permits') {
      initialItem = 'Pažeidimai kirtimuose';
    }

    if (widget.category == 'dumps') {
      isShowDumps = true;
    }

    super.initState();
  }

  Future<Position> getCurrentLocation() async {
    setState(() {
      isLocationLoading = true;
    });
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      isLocationLoading = false;
    });
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isMobile) ...[
          SizedBox(height: widget.width * 0.0278),
          SizedBox(
            width: widget.width * 0.911,
            child: PointerInterceptor(
              child: CustomDropdown<String>(
                hintText: 'Pasirinkite kategoriją',
                decoration: CustomDropdownDecoration(
                  listItemStyle: GoogleFonts.roboto(
                    fontSize: widget.width * 0.036,
                  ),
                  hintStyle: GoogleFonts.roboto(
                    fontSize: widget.width * 0.036,
                  ),
                  headerStyle: GoogleFonts.roboto(
                    fontSize: widget.width * 0.036,
                  ),
                ),
                items: _dropdownList,
                initialItem: initialItem,
                onChanged: (value) {
                  widget.onCategoryChange(getDropdownValueByString(value!));
                },
              ),
            ),
          ),
          SizedBox(height: widget.width * 0.0278),
        ] else ...[
          SizedBox(height: widget.width * 0.03125),
        ],
        MouseRegion(
          onEnter: (event) {
            widget.isHovering(true);
          },
          onExit: (event) {
            widget.isHovering(false);
          },
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: widget.isMobile
                        ? widget.width * 1.722
                        : widget.width * 0.4765,
                    width: widget.isMobile
                        ? widget.width * 0.9112
                        : widget.width * 0.84375,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(widget.isMobile ? 8 : 32)),
                      child: Stack(
                        children: [
                          FlutterMap(
                              options: MapOptions(
                                initialCenter: latlong.LatLng(
                                    widget.cameraPosition.target.latitude,
                                    widget.cameraPosition.target.longitude),
                                initialZoom: widget.cameraPosition.zoom,
                                onPositionChanged: (position, isFinished) {
                                  setState(() {
                                    selectedLat = position.center.latitude;
                                    selectedLong = position.center.longitude;
                                    selectedZoom = position.zoom;
                                  });
                                  unawaited(SecureStorageProvider()
                                      .setCameraSetup(gmaps.CameraPosition(
                                          target: gmaps.LatLng(
                                              selectedLat!, selectedLong!),
                                          zoom: selectedZoom)));
                                },
                              ),
                              mapController: mapController,
                              children: [
                                openStreetMapTileLayer,
                                MarkerClusterLayerWidget(
                                  options: MarkerClusterLayerOptions(
                                    maxClusterRadius: 80,
                                    size: const Size(40, 40),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(50),
                                    maxZoom: 15,
                                    markers: _markers,
                                    builder: (context, markers) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.green),
                                        child: Center(
                                          child: Text(
                                            markers.length.toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ]),
                          Positioned(
                            bottom: 110,
                            right: 10,
                            child: PointerInterceptor(
                              child: InkWell(
                                  onTap: () {},
                                  child: LocationSearchButton(
                                    width: 40,
                                    height: 40,
                                    onPressed: () async {
                                      isLocationLoading = true;
                                      _determinePosition().then(
                                          (currentPosition) {
                                        initPosition = LatLng(
                                            currentPosition.latitude,
                                            currentPosition.longitude);
                                        isLocationLoading = false;
                                        _animatedMapMove(initPosition, 18.0);
                                      },
                                          onError: (e) =>
                                              onError(e)).whenComplete(
                                        () => setState(
                                          () {
                                            isLocationLoading = false;
                                          },
                                        ),
                                      );
                                    },
                                    isLoading: isLocationLoading,
                                  )),
                            ),
                          ),
                          Positioned(
                            bottom: 65,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedZoom = selectedZoom + 1;
                                  mapController.move(
                                      LatLng(selectedLat ?? 55,
                                          selectedLong ?? 24),
                                      selectedZoom);
                                });
                              },
                              child: PointerInterceptor(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(
                                    Icons.zoom_in,
                                    color: Color(0xff707070),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (selectedZoom > 1) {
                                    selectedZoom = selectedZoom - 1;
                                  }

                                  mapController.move(
                                      LatLng(selectedLat ?? 55,
                                          selectedLong ?? 24),
                                      selectedZoom);
                                });
                              },
                              child: PointerInterceptor(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(
                                    Icons.zoom_out,
                                    color: Color(0xff707070),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (!widget.isMobile) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, right: 20),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  width: widget.width * 0.3,
                                  child: PointerInterceptor(
                                    child: CustomDropdown<String>(
                                      hintText: 'Pasirinkite kategoriją',
                                      decoration: CustomDropdownDecoration(
                                        listItemStyle: GoogleFonts.roboto(
                                          fontSize: widget.width * 0.0102,
                                        ),
                                        hintStyle: GoogleFonts.roboto(
                                          fontSize: widget.width * 0.0102,
                                        ),
                                        headerStyle: GoogleFonts.roboto(
                                          fontSize: widget.width * 0.0102,
                                        ),
                                      ),
                                      items: _dropdownList,
                                      initialItem: initialItem,
                                      onChanged: (value) {
                                        widget.onCategoryChange(
                                            getDropdownValueByString(value!));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              widget.category == 'dumps' || widget.category == 'trash'
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: widget.isMobile ? 8 : 20,
                        left: widget.isMobile ? 0 : 20,
                      ),
                      child: Align(
                        alignment: widget.isMobile
                            ? Alignment.topCenter
                            : Alignment.topLeft,
                        child: ReportTypeSwitcher(
                          isShowDumps: widget.category == 'dumps',
                          onReportTypeChange: (value) {
                            widget.onCategoryChange(value);
                          },
                          isMobile: widget.isMobile,
                          width: widget.width,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(height: widget.width * 0.0135),
        if (widget.category != 'dumps' && !widget.isMobile) ...[
          ReportStatistics(
            reportStatistics: widget.reportStatistics!,
          ),
          SizedBox(
            height: widget.width * 0.033,
          ),
          ReportTable(
            width: widget.width,
            reports: widget.reports!,
            onInformationTap: (refId) async {
              widget.onInformationTap!(refId);
              unawaited(await SecureStorageProvider()
                  .setActiveCategory(widget.category));
            },
          ),
        ]
      ],
    );
  }

  getDropdownValueByString(String value) {
    switch (value) {
      case 'Atliekos':
        return 'trash';
      case 'Sugadinta miško paklotė ir keliai':
        return 'forest';
      case 'Pažeidimai kirtimuose':
        return 'permits';
    }
  }

  Future<void> mapMarkers() async {
    List<Marker> tempMarkers = [];
    if (widget.reports != null) {
      for (var element in widget.reports!) {
        tempMarkers.add(
          Marker(
            point: latlong.LatLng(element.latitude, element.longitude),
            width: 40,
            height: 40,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: InfoTrashWindowBox(
                        title: element.name,
                        imageUrls: element.imageUrls.toList(),
                        status: element.status,
                        date: element.reportDate.toString(),
                        reportId: element.refId,
                        onTap: () {
                          widget.onInformationTap!(element.refId);
                        }),
                  ),
                );
              },
              child: Image.asset(
                getTrashIconPath(element.status),
                height: 20,
                width: 20,
              ),
            ),
          ),
        );
      }
    } else if (widget.dumps != null) {
      for (var element in widget.dumps!) {
        tempMarkers.add(
          Marker(
            point: latlong.LatLng(element.reportLat, element.reportLong),
            width: 40,
            height: 40,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: InfoDumpWindowBox(
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
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/svg/dump_icon.svg',
                height: 20,
                width: 20,
              ),
            ),
          ),
        );
      }
    }

    setState(() {
      _markers = tempMarkers;
      tempMarkers = [];
    });
  }

  String getTrashIconPath(String status) {
    if (status == "gautas") {
      return 'assets/icons/marker_pins/red_marker.png';
    } else if (status == "tiriamas") {
      return 'assets/icons/marker_pins/orange_marker.png';
    } else if (status == "išspręsta") {
      return 'assets/icons/marker_pins/green_marker.png';
    } else if (status == "nepasitvirtino") {
      return 'assets/icons/marker_pins/gray_marker.png';
    } else {
      return 'assets/icons/marker_pins/red_marker.png';
    }
  }
}
