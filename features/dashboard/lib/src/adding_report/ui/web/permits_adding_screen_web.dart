import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core/utils/permit.dart';
import 'package:dashboard/src/adding_report/ui/widgets/adding_screen_side_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:core_ui/core_ui.dart';
import 'dart:typed_data';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../widgets/explanation_dialog_widget.dart';

class PermitsAddingScreenWeb extends StatefulWidget {
  const PermitsAddingScreenWeb({
    required this.width,
    required this.height,
    required this.reports,
    required this.onAddTap,
    required this.onDataSecurityTap,
    super.key,
  });

  final double width;
  final double height;
  final List<PublicReportDto> reports;
  final Function(String, String, double, double, List<Uint8List>, bool)
      onAddTap;
  final VoidCallback onDataSecurityTap;

  @override
  State<PermitsAddingScreenWeb> createState() => _PermitsAddingScreenWebState();
}

class _PermitsAddingScreenWebState extends State<PermitsAddingScreenWeb> {
  List<Uint8List> _selectedImages = [];

  Future<void> getMultipleImageInfos() async {
    final images = await AppImagePicker().pickMultipleImages();

    setState(() {
      _selectedImages = (_selectedImages + images)
          .take(GlobalConstants.maxAllowedImageCount)
          .toList();

      calculateImagesSize();
    });
  }

  bool isTermsAccepted = false;
  bool isEmailsEnabled = true;
  final _formKey = GlobalKey<FormState>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  bool isShowMarkers = true;
  bool isMapDisabled = false;
  bool isImagesSizeValid = true;
  bool isShowPolygons = true;
  String currentTextValue = '';
  String currentEmailValue = '';
  Set<Marker> markers = {};
  Set<Polygon> polygons = {};
  List<Marker> addedMarker = [];
  double selectedLat = 0;
  double selectedLong = 0;
  MapType currentMapType = MapType.normal;
  CameraPosition _lithuaniaCameraPosition =
      const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0);
  late GoogleMapController mapController;
  LatLng? _currentPosition;
  bool _isLoading = false;
  bool _isMapLocked = false;
  bool _isPermitsLoading = false;

  void addCustomIcon() {
    BitmapDescriptor.asset(const ImageConfiguration(size: Size(45, 45)),
            'assets/svg/forest_pin_icon.svg')
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  void removeSelectedImage(int imageIndex) {
    setState(() {
      _selectedImages.removeAt(imageIndex);
      calculateImagesSize();
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addCustomIcon();
    });
    mapMarkers();
    getLocation();
    super.initState();
  }

  getLocation() async {
    setState(() {
      _isLoading = true;
      _isMapLocked = true;
    });

    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() {
        _isLoading = false;
        _isMapLocked = false;
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
        _isMapLocked = false;
        _lithuaniaCameraPosition =
            CameraPosition(target: _currentPosition!, zoom: 17);
      });
    }
  }

  void calculateImagesSize() {
    var imageSizes = 0;
    for (var element in _selectedImages) {
      imageSizes += element.lengthInBytes;
    }
    if (imageSizes > GlobalConstants.maxAllowedImageSizeInBytes) {
      isImagesSizeValid = false;
    } else {
      isImagesSizeValid = true;
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (!_isLoading) {
      _handleTap(LatLng(selectedLat, selectedLong));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Pranešti apie pažeidimą kirtimuose",
      color: const Color.fromRGBO(28, 63, 58, 1),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Form(
              key: _formKey,
              child: Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      SizedBox(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth * 0.68125,
                        child: _isLoading
                            ? Stack(
                                children: [
                                  Opacity(
                                    opacity: 0.5,
                                    child: GoogleMap(
                                      onMapCreated: _onMapCreated,
                                      buildingsEnabled: true,
                                      initialCameraPosition:
                                          _lithuaniaCameraPosition,
                                      mapType: currentMapType,
                                      onTap: null,
                                      zoomGesturesEnabled: false,
                                      scrollGesturesEnabled: false,
                                      tiltGesturesEnabled: false,
                                      rotateGesturesEnabled: false,
                                      zoomControlsEnabled: false,
                                      markers: isShowMarkers
                                          ? markers
                                          : addedMarker.map((e) => e).toSet(),
                                    ),
                                  ),
                                  Center(
                                    child: LoadingAnimationWidget
                                        .staggeredDotsWave(
                                      color: AppTheme.mainThemeColor,
                                      size: 150,
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                children: [
                                  GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    buildingsEnabled: true,
                                    initialCameraPosition:
                                        _lithuaniaCameraPosition,
                                    mapType: currentMapType,
                                    onTap: _handleTap,
                                    onCameraIdle: _onCameraIdle,
                                    zoomControlsEnabled: false,
                                    zoomGesturesEnabled: !_isMapLocked,
                                    scrollGesturesEnabled: !_isMapLocked,
                                    tiltGesturesEnabled: !_isMapLocked,
                                    rotateGesturesEnabled: !_isMapLocked,
                                    polygons: isShowPolygons ? polygons : {},
                                    markers: isShowMarkers
                                        ? markers
                                        : addedMarker.map((e) => e).toSet(),
                                  ),
                                  if (_isPermitsLoading)
                                    Center(
                                      child: LoadingAnimationWidget
                                          .staggeredDotsWave(
                                        color: AppTheme.mainThemeColor,
                                        size: 150,
                                      ),
                                    ),
                                ],
                              ),
                      ),
                      _currentPosition != null && !_isLoading
                          ? Positioned(
                              bottom: 115,
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
                                        await getLocation();
                                      },
                                      isLoading: _isLoading,
                                    ),
                                  )),
                            )
                          : const SizedBox.shrink(),
                      if (!_isLoading)
                        Positioned(
                          bottom: 70,
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
                                          MapTypeChangeDialog(
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
                                                isShowPolygons =
                                                    !isShowPolygons;
                                              });
                                            },
                                            onReportVisibilityChange: () {
                                              setState(() {
                                                isShowMarkers = !isShowMarkers;
                                              });
                                            },
                                            isReportsActive: isShowMarkers,
                                            isPermitsActive: isShowPolygons,
                                            isMobile: false,
                                          ));
                                },
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  AddingScreenSideBar(
                    width: widget.width,
                    height: widget.height,
                    title: 'Pranešti apie pažeidimą kirtimuose',
                    onExitTap: () {
                      context.goNamed("home");
                    },
                    onImageAddTap: () {
                      getMultipleImageInfos();
                    },
                    onFinalTap: () async {
                      if (_formKey.currentState!.validate() &&
                          selectedLat != 0 &&
                          selectedLong != 0 &&
                          isTermsAccepted &&
                          _selectedImages.isNotEmpty &&
                          isImagesSizeValid) {
                        if (_selectedImages.length >= 2) {
                          widget.onAddTap(
                            currentEmailValue,
                            currentTextValue,
                            selectedLat,
                            selectedLong,
                            _selectedImages,
                            isEmailsEnabled,
                          );
                        }
                      }
                    },
                    onImageRemoveTap: (index) {
                      removeSelectedImage(index);
                    },
                    onTextChange: (textValue) {
                      setState(() {
                        currentTextValue = textValue;
                      });
                    },
                    onEmailChange: (emailValue) {
                      setState(() {
                        currentEmailValue = emailValue;
                      });
                    },
                    selectedImages: _selectedImages,
                    onTermsChange: (termsValue) {
                      setState(() {
                        isTermsAccepted = termsValue;
                      });
                    },
                    onEmailsEnabledChange: (emailsEnabledValue) {
                      setState(() {
                        isEmailsEnabled = emailsEnabledValue;
                      });
                    },
                    isImagesSizeValid: isImagesSizeValid,
                    isTermsAccepted: isTermsAccepted,
                    isEmailsEnabled: isEmailsEnabled,
                    category: 'permits',
                    onExplanationTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.white.withOpacity(0),
                          builder: (context) {
                            return ExplanationDialogWidget(
                              width: widget.width,
                              category: 'permits',
                              isMobile: false,
                            );
                          });
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    markers.removeWhere(
        (element) => element.markerId == const MarkerId('9998999'));
    addedMarker.removeWhere(
        (element) => element.markerId == const MarkerId('9998999'));
    Marker newMarker = Marker(
      markerId: const MarkerId(
        '9998999',
      ),
      icon: markerIcon,
      position: LatLng(
        tappedPoint.latitude,
        tappedPoint.longitude,
      ),
      draggable: true,
      onDrag: _handleDrag,
      onDragEnd: _handleDragEnd,
    );

    setState(() {
      markers.add(newMarker);
      addedMarker.add(newMarker);
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
      mapController.moveCamera(CameraUpdate.newLatLng(tappedPoint));
    });
  }

  _handleDrag(LatLng tappedPoint) {
    setState(() {
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
    });
  }

  _onCameraIdle() async {
    LatLngBounds visibleBounds = await mapController.getVisibleRegion();
    double cameraZoom = await mapController.getZoomLevel();
    if (cameraZoom < 13) {
      setState(() {
        polygons = {};
      });
    } else if (isShowPolygons) {
      setState(() {
        _isMapLocked = true;
        _isPermitsLoading = true;
      });
      List<Permit> polygons = await ApiProvider().getVisiblePermits(
        minLat: visibleBounds.southwest.latitude,
        minLong: visibleBounds.southwest.longitude,
        maxLat: visibleBounds.northeast.latitude,
        maxLong: visibleBounds.northeast.longitude,
      );
      setState(() {
        mapPolygons(polygons, visibleBounds);
        _isMapLocked = false;
        _isPermitsLoading = false;
      });
    }
  }

  _handleDragEnd(LatLng tappedPoint) {
    setState(() {
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
      mapController.moveCamera(CameraUpdate.newLatLng(tappedPoint));
    });
  }

  Future<void> mapMarkers() async {
    int index = 0;
    for (var element in widget.reports) {
      markers.add(
        Marker(
          markerId: MarkerId(
            element.name + index.toString(),
          ),
          position: LatLng(
            element.latitude.toDouble(),
            element.longitude.toDouble(),
          ),
        ),
      );
      index++;
    }
  }

  Future<void> mapPolygons(List<Permit> permits, LatLngBounds bounds) async {
    Set<Polygon> tempPolygons = {};
    for (var i = 0; i < permits.length; i++) {
      List<LatLng> coordinates = [];
      for (var j = 0; j < permits[i].geometry!.coordinates![0][0].length; j++) {
        coordinates.add(LatLng(permits[i].geometry!.coordinates![0][0][j][1],
            permits[i].geometry!.coordinates![0][0][j][0]));
      }
      tempPolygons.add(
        Polygon(
          polygonId: PolygonId("P-$i"),
          points: coordinates,
          fillColor: const Color.fromRGBO(255, 106, 61, 0.3),
          strokeWidth: 1,
          strokeColor: const Color.fromRGBO(255, 106, 61, 1),
          onTap: () {
            _handleTap(LatLng(permits[i].geometry!.coordinates![0][0][0][1],
                permits[i].geometry!.coordinates![0][0][0][0]));
            showDialog(
                context: context,
                barrierColor: Colors.white.withOpacity(0),
                builder: (context) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.width * 0.011,
                        vertical: widget.width * 0.011,
                      ),
                      child: Material(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: InfoPermitWindowBox(
                          width: widget.width,
                          isMobile: false,
                          type: permits[i].properties!.tipas ?? '',
                          issuedFrom: permits[i].properties!.galiojaNuo ?? '',
                          issuedTo: permits[i].properties!.galiojaIki ?? '',
                          cadastralNumber:
                              permits[i].properties!.kadastrinisNr ?? '',
                          subdivision:
                              permits[i].properties!.vmuPadalinys ?? '',
                          forestryDistrict:
                              permits[i].properties!.girininkija ?? '',
                          block: permits[i].properties!.kvartalas,
                          plot: permits[i].properties!.sklypas ?? '',
                          cuttableArea: permits[i].properties!.kertamasPlotas,
                          dominantTree:
                              permits[i].properties!.vyraujantysMedziai ?? '',
                          cuttingType:
                              permits[i].properties!.kirtimoRusis ?? '',
                          reinstatementType:
                              permits[i].properties!.atkurimoBudas ?? '',
                        ),
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
      tempPolygons = {};
    });
  }
}
