import 'dart:async';
import 'package:api_client/api_client.dart';
import 'package:dashboard/src/home/ui/tile_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster_2/flutter_map_marker_cluster.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';


class AddPinScreenMobile extends StatefulWidget {
  const AddPinScreenMobile(
      {required this.width,
      required this.markers,
      required this.isLayerSwitchVisible,
      required this.onTap,
      required this.reports,
      this.onError,
      this.buildContext,
      super.key});

  final double width;
  final List<Marker> markers;
  final bool isLayerSwitchVisible;
  final List<PublicReportDto> reports;
  final Function(double, double) onTap;
  final void Function(Exception e)? onError;
  final BuildContext? buildContext;

  @override
  State<AddPinScreenMobile> createState() => _AddPinScreenMobileState();
}

class _AddPinScreenMobileState extends State<AddPinScreenMobile>
    with TickerProviderStateMixin {
  double? selectedLat;
  double? selectedLong;
  double selectedZoom = 7;
  List<Marker> markers = [];
  bool isShowMarkers = true;
  bool isSaveButtonActive = false;
  bool isMapDisabled = false;
  bool isMapLoaded = false;
  late void Function(Exception e) onError;


  MapController mapController = MapController();
  final bool _isLoading = false;
  bool isLoading = false;

  late AnimationController _animationController;
  LatLng initPosition = const LatLng(55, 24);
  late List<Marker> markers2 = [];

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
        duration: const Duration(seconds: 1),
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
    mapController = MapController();
    onError = widget.onError ?? (e) => debugPrint(e.toString());
    markers = widget.markers;
    mapMarkers(widget.reports);

    isLoading = true;
    _determinePosition().then((currentPosition) {
      initPosition =
          LatLng(currentPosition.latitude, currentPosition.longitude);
      isLoading = false;
      _animatedMapMove(initPosition, 18.0);
    }, onError: (e) => onError(e)).whenComplete(
      () => setState(
        () {
          isLoading = false;
        },
      ),
    );
    mapController.mapEventStream.listen((event) {
      if (event.camera.zoom > 12) {
        isMapLoaded = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: widget.width,
            height: widget.width * 0.133,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: widget.width * 0.05,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: widget.width * 0.0278),
                SizedBox(
                  width: widget.width * 0.561,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Pasirinkite vietą žemėlapyje',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              SizedBox(
                  height: size.height - widget.width * 0.133,
                  width: widget.width,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      initialCenter: const LatLng(55, 24),
                      interactionOptions: const InteractionOptions(
                        flags: InteractiveFlag.pinchZoom |
                            InteractiveFlag.drag |
                            InteractiveFlag.scrollWheelZoom,
                      ),
                      initialZoom: 7,
                      onPositionChanged: (position, isFinished) {
                        setState(() {
                          selectedLat = position.center.latitude;
                          selectedLong = position.center.longitude;
                          selectedZoom = position.zoom;
                        });
                      },
                    ),
                    children: [
                      openStreetMapTileLayer,
                      if (isShowMarkers)
                        MarkerClusterLayerWidget(
                          options: MarkerClusterLayerOptions(
                            maxClusterRadius: 80,
                            size: const Size(40, 40),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(50),
                            maxZoom: 15,
                            markers: markers2,
                            builder: (context, markers) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green),
                                child: Center(
                                  child: Text(
                                    markers.length.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                      //PolygonLayer(polygons: polygons)
                    ],
                  )),
              Positioned(
                bottom: size.height / 2,
                left: size.width / 2,
                child: SvgPicture.asset(
                  'assets/svg/forest_pin_icon.svg',
                  height: 35,
                  width: 25,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: _isLoading
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: const Color.fromRGBO(28, 63, 58, 1), size: 150)
                    : Padding(
                        padding: EdgeInsets.only(top: widget.width * 0.0666),
                        child: PointerInterceptor(
                          child: SavePinButtonMobile(
                            width: widget.width,
                            isActive:
                                selectedLat != null && selectedLong != null,
                            onHover: (isHover) {
                              setState(() {
                                isMapDisabled = isHover;
                              });
                            },
                            onTap: () {
                              widget.onTap(
                                selectedLat!,
                                selectedLong!,
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
              ),
              Positioned(
                bottom: 155,
                right: 10,
                child: InkWell(
                    onTap: () {},
                    onHover: (isHover) {
                      setState(() {
                        isMapDisabled = isHover;
                      });
                    },
                    child: PointerInterceptor(
                      child: LocationSearchButton(
                        width: 40,
                        height: 40,
                        onPressed: () async {
                          isLoading = true;
                          _determinePosition().then((currentPosition) {
                            initPosition = LatLng(currentPosition.latitude,
                                currentPosition.longitude);
                            isLoading = false;
                            _animatedMapMove(initPosition, 18.0);
                          }, onError: (e) => onError(e)).whenComplete(
                            () => setState(
                              () {
                                isLoading = false;
                              },
                            ),
                          );
                        },
                        isLoading: isLoading,
                      ),
                    )),
              ),
              Positioned(
                bottom: 110,
                right: 10,
                child: InkWell(
                  onTap: () {},
                  onHover: (isHover) {
                    setState(() {
                      isMapDisabled = isHover;
                    });
                  },
                  child: PointerInterceptor(
                    child: GoogleMapTypeButton(
                      height: 40,
                      width: 40,
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                MapTypeChangeDialogOsm(
                                        width: widget.width,
                                        onHover: (isHover) {
                                          setState(() {
                                            isMapDisabled = isHover;
                                          });
                                        },
                                        isMobile: true,
                                        onReportVisibilityChange: () {
                                          setState(() {
                                            isShowMarkers = !isShowMarkers;
                                          });
                                        },
                                        isReportsActive: isShowMarkers,
                                      ));
                      },
                    ),
                  ),
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
                          LatLng(selectedLat ?? 55, selectedLong ?? 24),
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
                          LatLng(selectedLat ?? 55, selectedLong ?? 24),
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
            ],
          )
        ],
      ),
    );
  }


  LatLngBounds getCurrentBounds() {
    final center = mapController.camera.center;
    final zoom = mapController.camera.zoom;

    final mapPixelSize = MediaQuery.of(context).size;

    final latDelta = 180 / (1 << zoom.toInt()) * (mapPixelSize.height / 256);
    final lngDelta = 360 / (1 << zoom.toInt()) * (mapPixelSize.width / 256);

    final southWest = LatLng(
      center.latitude - latDelta / 2,
      center.longitude - lngDelta / 2,
    );
    final northEast = LatLng(
      center.latitude + latDelta / 2,
      center.longitude + lngDelta / 2,
    );
    return LatLngBounds(southWest, northEast);
  }


  Future<void> mapMarkers(List<PublicReportDto> reports) async {
    List<Marker> tempMarkers = [];
    for (var i = 0; i < reports.length; i++) {
      tempMarkers.add(
        Marker(
          point: LatLng(reports[i].latitude, reports[i].longitude),
          width: 40,
          height: 40,
          child: Image.asset(
            getTrashIconPath(reports[i].status),
            height: 20,
            width: 20,
          ),
        ),
      );
    }
    setState(() {
      markers2 = tempMarkers;
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
