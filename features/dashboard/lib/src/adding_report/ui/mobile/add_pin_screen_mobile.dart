import 'package:core/utils/permit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AddPinScreenMobile extends StatefulWidget {
  const AddPinScreenMobile(
      {required this.width,
      required this.markers,
      this.permits,
      required this.isLayerSwitchVisible,
      required this.isPermitSwitchVisible,
      required this.onTap,
      super.key});

  final double width;
  final Set<Marker> markers;
  final Permit? permits;
  final bool isLayerSwitchVisible;
  final bool isPermitSwitchVisible;
  final Function(double, double, Marker) onTap;

  @override
  State<AddPinScreenMobile> createState() => _AddPinScreenMobileState();
}

class _AddPinScreenMobileState extends State<AddPinScreenMobile> {
  MapType currentMapType = MapType.normal;
  CameraPosition _lithuaniaCameraPosition =
      const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0);
  double selectedLat = 0;
  double selectedLong = 0;
  Set<Marker> markers = {};
  Set<Polygon> polygons = {};
  List<Marker> addedMarker = [];
  bool isShowMarkers = true;
  bool isShowPolygons = false;
  bool isSaveButtonActive = false;
  bool isMapDisabled = false;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  late GoogleMapController mapController;
  LatLng? _currentPosition;
  bool _isLoading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addCustomIcon();
    });
    markers = widget.markers;
    if (widget.permits != null) {
      isShowPolygons = true;
      mapPolygons(widget.permits!);
    }
    getLocation();
    super.initState();
  }

  getLocation() async {
    setState(() {
      _isLoading = true;
    });

    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() {
        _isLoading = false;
      });
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      LatLng location = LatLng(position.latitude, position.longitude);

      setState(() {
        selectedLat = position.latitude;
        selectedLong = position.longitude;
        _currentPosition = location;
        _isLoading = false;
        _handleTap(location);
        _lithuaniaCameraPosition =
            CameraPosition(target: _currentPosition!, zoom: 13);
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
                      if (addedMarker.isNotEmpty) {
                        markers.remove(addedMarker[0]);
                        addedMarker.clear();
                      }
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
                child: _isLoading
                    ? Stack(
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: GoogleMap(
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: _lithuaniaCameraPosition,
                              mapType: currentMapType,
                              onTap: null,
                              markers: isShowMarkers
                                  ? markers
                                  : addedMarker.map((e) => e).toSet(),
                            ),
                          ),
                          Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: AppTheme.mainThemeColor,
                              size: 150,
                            ),
                          ),
                        ],
                      )
                    : widget.permits == null
                        ? GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: _lithuaniaCameraPosition,
                            mapType: currentMapType,
                            onTap: _currentPosition == null ? _handleTap : null,
                            markers: isShowMarkers
                                ? markers
                                : addedMarker.map((e) => e).toSet(),
                          )
                        : GoogleMap(
                            polygons: isShowPolygons ? polygons : {},
                            markers: isShowMarkers
                                ? markers
                                : addedMarker.map((e) => e).toSet(),
                            webGestureHandling: WebGestureHandling.cooperative,
                            mapType: currentMapType,
                            onTap: _currentPosition == null ? _handleTap : null,
                            buildingsEnabled: true,
                            initialCameraPosition: _lithuaniaCameraPosition,
                            onMapCreated: _onMapCreated,
                          ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: widget.width * 0.0666),
                  child: SavePinButtonMobile(
                    width: widget.width,
                    isActive: isSaveButtonActive,
                    onHover: (isHover) {
                      setState(() {
                        isMapDisabled = isHover;
                      });
                    },
                    onTap: () {
                      widget.onTap(
                          selectedLat,
                          selectedLong,
                          Marker(
                            markerId: const MarkerId('99899'),
                            position: LatLng(selectedLat, selectedLong),
                            icon: markerIcon,
                          ));
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              _currentPosition != null
                  ? Positioned(
                      bottom: 155,
                      right: 10,
                      child: InkWell(
                          onTap: () {},
                          onHover: (isHover) {
                            setState(() {
                              isMapDisabled = isHover;
                            });
                          },
                          child: LocationSearchButton(
                            width: 40,
                            height: 40,
                            onPressed: () {
                              mapController.animateCamera(
                                  CameraUpdate.newLatLngZoom(
                                      _currentPosition!, 13));
                            },
                          )),
                    )
                  : const SizedBox.shrink(),
              widget.isLayerSwitchVisible && !widget.isPermitSwitchVisible
                  ? Positioned(
                      left: widget.width * 0.0333,
                      bottom: widget.width * 0.0333,
                      child: ChangeVisibilityButtonMobile(
                        width: widget.width,
                        isActive: isShowMarkers,
                        isPermits: false,
                        onHover: (isHover) {
                          setState(() {
                            isMapDisabled = isHover;
                          });
                        },
                        onTap: () {
                          setState(() {
                            isShowMarkers = !isShowMarkers;
                          });
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
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
                  child: GoogleMapTypeButton(
                    height: 40,
                    width: 40,
                    onPressed: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              widget.isPermitSwitchVisible
                                  ? MapTypeChangeDialog(
                                      width: widget.width,
                                      currentMapType: currentMapType,
                                      onHover: (isHover) {
                                        setState(() {
                                          isMapDisabled = isHover;
                                        });
                                      },
                                      onChangeTap: (MapType mapType) {
                                        setState(() {
                                          currentMapType = mapType;
                                        });
                                      },
                                      onPermitsVisibilityChange: () {
                                        setState(() {
                                          isShowPolygons = !isShowPolygons;
                                        });
                                      },
                                      onReportVisibilityChange: () {
                                        setState(() {
                                          isShowMarkers = !isShowMarkers;
                                        });
                                      },
                                      isReportsActive: isShowMarkers,
                                      isPermitsActive: isShowPolygons,
                                    )
                                  : MapTypeChangeDialog(
                                      width: widget.width,
                                      currentMapType: currentMapType,
                                      onHover: (isHover) {
                                        setState(() {
                                          isMapDisabled = isHover;
                                        });
                                      },
                                      onChangeTap: (MapType mapType) {
                                        setState(() {
                                          currentMapType = mapType;
                                        });
                                      }));
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    markers
        .removeWhere((element) => element.markerId == const MarkerId('99899'));
    addedMarker
        .removeWhere((element) => element.markerId == const MarkerId('99899'));
    Marker newMarker = Marker(
      markerId: const MarkerId(
        '99899',
      ),
      icon: markerIcon,
      position: LatLng(
        tappedPoint.latitude,
        tappedPoint.longitude,
      ),
      draggable: true,
      onDrag: _handleDrag,
    );

    setState(() {
      markers.add(newMarker);
      addedMarker.add(newMarker);
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
      isSaveButtonActive = true;
    });
  }

  _handleDrag(LatLng tappedPoint) {
    setState(() {
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
      isSaveButtonActive = true;
    });
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/svg/pin_icon.svg')
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  Future<void> mapPolygons(Permit permit) async {
    Set<Polygon> tempPolygons = {};
    for (var i = 0; i < permit.features!.length; i++) {
      List<LatLng> coordinates = [];
      for (var j = 0;
          j < permit.features![i].geometry!.coordinates![0][0].length;
          j++) {
        coordinates.add(LatLng(
            permit.features![i].geometry!.coordinates![0][0][j][1],
            permit.features![i].geometry!.coordinates![0][0][j][0]));
      }
      tempPolygons.add(
        Polygon(
          polygonId: PolygonId("P-$i"),
          points: coordinates,
          fillColor: const Color.fromRGBO(255, 106, 61, 0.3),
          strokeWidth: 1,
          strokeColor: const Color.fromRGBO(255, 106, 61, 1),
          onTap: () {
            showDialog(
                context: context,
                barrierColor: Colors.white.withOpacity(0),
                builder: (context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                      ),
                      child: InfoPermitWindowBox(
                        width: widget.width,
                        isMobile: true,
                        type: permit.features![i].properties!.tipas ?? '',
                        issuedFrom:
                            permit.features![i].properties!.galiojaNuo ?? '',
                        issuedTo:
                            permit.features![i].properties!.galiojaIki ?? '',
                        cadastralNumber:
                            permit.features![i].properties!.kadastrinisNr ?? '',
                        subdivision:
                            permit.features![i].properties!.vmuPadalinys ?? '',
                        forestryDistrict:
                            permit.features![i].properties!.girininkija ?? '',
                        block: permit.features![i].properties!.kvartalas,
                        plot: permit.features![i].properties!.sklypas ?? '',
                        cuttableArea:
                            permit.features![i].properties!.kertamasPlotas,
                        dominantTree: permit
                                .features![i].properties!.vyraujantysMedziai ??
                            '',
                        cuttingType:
                            permit.features![i].properties!.kirtimoRusis ?? '',
                        reinstatementType:
                            permit.features![i].properties!.atkurimoBudas ?? '',
                      ),
                    ),
                  );
                });
          },
        ),
      );
    }
    setState(() {
      polygons = tempPolygons;
    });
  }
}
