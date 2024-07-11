import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:core_ui/core_ui.dart';
import 'dart:typed_data';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import '../widgets/adding_screen_side_bar.dart';

class TrashAddingScreenWeb extends StatefulWidget {
  const TrashAddingScreenWeb({
    required this.width,
    required this.height,
    required this.reports,
    required this.onAddTap,
    super.key,
  });

  final double width;
  final double height;
  final List<PublicReportDto> reports;
  final Function(String, String, double, double, List<Uint8List>) onAddTap;

  @override
  State<TrashAddingScreenWeb> createState() => _TrashAddingScreenWebState();
}

class _TrashAddingScreenWebState extends State<TrashAddingScreenWeb> {
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
  final _formKey = GlobalKey<FormState>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  bool isShowMarkers = true;
  bool isMapDisabled = false;
  bool isImagesSizeValid = true;

  String currentTextValue = '';
  String currentEmailValue = '';
  Set<Marker> markers = {};
  List<Marker> addedMarker = [];
  double selectedLat = 0;
  double selectedLong = 0;
  MapType currentMapType = MapType.normal;
  CameraPosition _lithuaniaCameraPosition =
      const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0);

  late GoogleMapController mapController;
  LatLng? _currentPosition;
  bool _isLoading = false;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/svg/pin_icon.svg')
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
            CameraPosition(target: _currentPosition!, zoom: 15);
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
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Pranešti apie atliekas",
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
                            : GoogleMap(
                                onMapCreated: _onMapCreated,
                                buildingsEnabled: true,
                                initialCameraPosition: _lithuaniaCameraPosition,
                                mapType: currentMapType,
                                onTap: _handleTap,
                                markers: isShowMarkers
                                    ? markers
                                    : addedMarker.map((e) => e).toSet(),
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
                                  child: PointerInterceptor(
                                    child: LocationSearchButton(
                                      width: 40,
                                      height: 40,
                                      onPressed: () {
                                        setState(() async {
                                          await getLocation();
                                        });
                                      },
                                      isLoading: _isLoading,
                                    ),
                                  )),
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
                                          onReportVisibilityChange: () {
                                            setState(() {
                                              isShowMarkers = !isShowMarkers;
                                            });
                                          },
                                          isReportsActive: isShowMarkers,
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
                    title: 'Pranešti apie atliekas gamtoje',
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
                    isImagesSizeValid: isImagesSizeValid,
                    isTermsAccepted: isTermsAccepted,
                    category: 'trash',
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

  _handleDragEnd(LatLng tappedPoint) {
    setState(() {
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
      mapController.moveCamera(CameraUpdate.newLatLng(tappedPoint));
    });
  }

  _handleDrag(LatLng tappedPoint) {
    setState(() {
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
      mapController.moveCamera(CameraUpdate.newLatLng(tappedPoint));
    });
  }
}
