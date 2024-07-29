import 'dart:async';
import 'package:core/utils/permit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class AddPinScreenMobile extends StatefulWidget {
  const AddPinScreenMobile(
      {required this.width,
      this.permits,
      required this.isLayerSwitchVisible,
      required this.isPermitSwitchVisible,
      required this.onTap,
      super.key});

  final double width;
  final Permit? permits;
  final bool isLayerSwitchVisible;
  final bool isPermitSwitchVisible;
  final Function(double, double) onTap;

  @override
  State<AddPinScreenMobile> createState() => _AddPinScreenMobileState();
}

class _AddPinScreenMobileState extends State<AddPinScreenMobile> {
  double selectedLat = 0;
  double selectedLong = 0;
  bool isShowMarkers = true;
  bool isShowPolygons = false;
  bool isSaveButtonActive = false;
  bool isMapDisabled = false;

  bool _isLoading = false;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   addCustomIcon();
    // });
    // markers = widget.markers;
    // if (widget.permits != null) {
    //   isShowPolygons = true;
    //   mapPolygons(widget.permits!);
    // }
    // getLocation();
    super.initState();
  }

  getLocation() async {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void dispose() {
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
                //child: widget.permits == null
                // ? GoogleMap(
                //     initialCameraPosition: _lithuaniaCameraPosition,
                //   )
                // GoogleMap(
                //         onMapCreated: _onMapCreated,
                //         initialCameraPosition: _lithuaniaCameraPosition,
                //         webGestureHandling: WebGestureHandling.cooperative,
                //         mapType: currentMapType,
                //         onTap: _handleTap,
                //         markers: isShowMarkers
                //             ? markers
                //             : addedMarker.map((e) => e).toSet(),
                //       )
                // : GoogleMap(
                //     initialCameraPosition: _lithuaniaCameraPosition,
                //   ),
                // GoogleMap(
                //         polygons: isShowPolygons ? polygons : {},
                //         markers: isShowMarkers
                //             ? markers
                //             : addedMarker.map((e) => e).toSet(),
                //         webGestureHandling: WebGestureHandling.cooperative,
                //         mapType: currentMapType,
                //         onTap: _handleTap,
                //         buildingsEnabled: true,
                //         initialCameraPosition: _lithuaniaCameraPosition,
                //         onMapCreated: _onMapCreated,
                //       ),
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
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
              ),
              true
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
                              onPressed: () async {
                                await getLocation();
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


                      },
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

}
