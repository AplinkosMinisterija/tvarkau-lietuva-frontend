import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AddPinScreenMobile extends StatefulWidget {
  const AddPinScreenMobile({
    required this.width,
    required this.selectedLocation,
    required this.onTap,
    required this.reports,
    super.key,
  });

  final double width;
  final LatLng? selectedLocation;
  final List<PublicReportDto> reports;
  final Function(LatLng) onTap;

  @override
  State<AddPinScreenMobile> createState() => _AddPinScreenMobileState();
}

class _AddPinScreenMobileState extends State<AddPinScreenMobile> {
  MapType currentMapType = MapType.normal;
  bool isShowMarkers = true;
  bool isSaveButtonActive = false;
  bool isMapDisabled = false;
  late GoogleMapController mapController;
  LatLng? _currentPosition;
  bool _isLoading = false;
  late LatLng? _selectedLocation = widget.selectedLocation;

  late final _reportMarkersLayer = AppMapMarkersLayer.fromPublicReports(
    widget.reports,
  );

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
        _currentPosition = location;
        _isLoading = false;
        _handleTap(location);
      });
    }
  }

  AppMapMarkersLayer _getMarkerLayers() {
    final selectedLocation = _selectedLocation;
    if (selectedLocation == null) {
      return _reportMarkersLayer;
    }
    return _reportMarkersLayer.combine(
      AppMapMarkersLayer.fromPinLocation(selectedLocation),
    );
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
                      Navigator.of(context).pop(_selectedLocation);
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
                )
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
                            child: AppMap(
                              onMapCreated: _onMapCreated,
                              markersLayer: _reportMarkersLayer,
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
                    : AppMap(
                        onMapCreated: _onMapCreated,
                        onTap: _currentPosition == null ? _handleTap : null,
                        markersLayer: _getMarkerLayers(),
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
                      final selectedLocation = _selectedLocation;
                      if (selectedLocation != null) {
                        widget.onTap(selectedLocation);
                      }

                      Navigator.of(context).pop(_selectedLocation);
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
              Positioned(
                left: widget.width * 0.0333,
                bottom: widget.width * 0.0333,
                child: ChangeVisibilityButtonMobile(
                  width: widget.width,
                  isActive: isShowMarkers,
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
                                  }));
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    setState(() {
      _selectedLocation = tappedPoint;
      isSaveButtonActive = true;
    });
  }

  _handleDrag(LatLng tappedPoint) {
    setState(() {
      _selectedLocation = tappedPoint;
      isSaveButtonActive = true;
    });
  }
}
