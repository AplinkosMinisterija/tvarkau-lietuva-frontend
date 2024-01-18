import 'package:api_client/api_client.dart';
import 'package:core/constants/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:latlong2/latlong.dart';

class AddPinScreenMobile extends StatefulWidget {
  const AddPinScreenMobile(
      {required this.width, required this.reports, super.key});

  final double width;
  final List<PublicReportDto> reports;

  @override
  State<AddPinScreenMobile> createState() => _AddPinScreenMobileState();
}

class _AddPinScreenMobileState extends State<AddPinScreenMobile> {
  static const double _locationMarkerSize = 50;
  LatLng selectedPosition = GlobalConstants.lithuaniaCenterLatLng;

  bool isShowMarkers = true;
  bool isMapDisabled = false;
  bool _isLoading = false;

  @override
  void initState() {
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

      setState(() {
        selectedPosition = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    }
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
                  onTap: () => Navigator.of(context).pop(),
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
                          const Opacity(
                            opacity: 0.5,
                            child: AppMap(
                              disableInteractiveMap: true,
                              layers: [],
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
                        initialCenter: selectedPosition,
                        onPositionChanged: (position, _) {
                          final latLng = position.center;
                          if (latLng != null) {
                            onPositionChanged(latLng);
                          }
                        },
                        layers: [
                          const CurrentUserLocation(),
                          if (isShowMarkers)
                            PublicReportsLayer(reports: widget.reports),
                          SingleMarkerLayer(
                            width: _locationMarkerSize,
                            height: _locationMarkerSize,
                            point: selectedPosition,
                            alignment: Alignment.bottomCenter,
                            child: MarkerIconFactory.reportDefault(),
                          )
                        ],
                      ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: widget.width * 0.0666),
                  child: SavePinButtonMobile(
                    width: widget.width,
                    onHover: (isHover) {
                      setState(() {
                        isMapDisabled = isHover;
                      });
                    },
                    onTap: () => Navigator.of(context).pop(selectedPosition),
                  ),
                ),
              ),
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
            ],
          )
        ],
      ),
    );
  }

  onPositionChanged(LatLng selectedPosition) {
    setState(() {
      this.selectedPosition = selectedPosition;
    });
  }
}
