import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:core_ui/core_ui.dart';
import 'dart:typed_data';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    });
  }

  bool isTermsAccepted = false;
  final _formKey = GlobalKey<FormState>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  bool isShowMarkers = true;
  bool isMapDisabled = false;
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
            CameraPosition(target: _currentPosition!, zoom: 13);
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Pranešti apie pažeidimą",
      color: Colors.green,
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
                        width: constraints.maxWidth * 0.7,
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
                                onTap: _currentPosition == null
                                    ? _handleTap
                                    : null,
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
                                  child: LocationSearchButton(
                                    width: 40,
                                    height: 40,
                                    onPressed: () {
                                      setState(() {
                                        mapController.animateCamera(
                                            CameraUpdate.newLatLngZoom(
                                                _currentPosition!, 13));
                                      });
                                    },
                                  )),
                            )
                          : const SizedBox.shrink(),
                      Positioned(
                        left: widget.width * 0.0111,
                        bottom: widget.width * 0.0111,
                        child: ChangeVisibilityButtonMobile(
                          width: widget.width / 2.4,
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
                                          width: widget.width / 2.4,
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
                      InstructionsWidget(width: widget.width),
                    ],
                  ),
                  SizedBox(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth * 0.3,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(widget.width * 0.025),
                        child: Column(
                          children: [
                            ExitHeader(
                                width: widget.width,
                                onTap: () {
                                  context.goNamed("home");
                                }),
                            SizedBox(
                              height: widget.width * 0.0125,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Pranešimo turinys',
                                style: GoogleFonts.roboto(
                                  fontSize: widget.width * 0.01145,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0x660a3328),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: widget.width * 0.004,
                            ),
                            Container(
                              height: widget.width * 0.125,
                              padding: EdgeInsets.all(
                                widget.width * 0.01,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: TextFormField(
                                maxLines: 10,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Prašome įvesti pranešimo turinį';
                                  }
                                  return null;
                                },
                                onChanged: (textValue) {
                                  setState(() {
                                    currentTextValue = textValue;
                                  });
                                },
                                style: GoogleFonts.roboto(
                                    fontSize: widget.width * 0.0125,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: widget.width * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Jūsų el. pašto adresas',
                                style: GoogleFonts.roboto(
                                  fontSize: widget.width * 0.01145,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0x660a3328),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: widget.width * 0.004,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: widget.width * 0.045,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                Container(
                                  height: widget.width * 0.045,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: widget.width * 0.01,
                                  ),
                                  child: TextFormField(
                                    maxLines: 1,
                                    textAlignVertical: TextAlignVertical.top,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Prašome įvesti el. pašto adresą';
                                      } else if (RegExp(
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                          .hasMatch(value)) {
                                        return null;
                                      } else {
                                        return 'Prašome įvesti teisingą el. pašto adresą';
                                      }
                                    },
                                    onChanged: (emailValue) {
                                      setState(() {
                                        currentEmailValue = emailValue;
                                      });
                                    },
                                    style: GoogleFonts.roboto(
                                        fontSize: widget.width * 0.0125,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: widget.width * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Įkelkite bent 2 pažeidimo nuotraukas',
                                style: GoogleFonts.roboto(
                                  fontSize: widget.width * 0.01145,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0x660a3328),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: widget.width * 0.004,
                            ),
                            ImageAddButtonMobile(
                                width: widget.width / 2.4,
                                title: _selectedImages.isNotEmpty
                                    ? 'Įkelti kitas nuotraukas'
                                    : 'Įkelti nuotraukas',
                                onTap: () {
                                  getMultipleImageInfos();
                                }),
                            SizedBox(
                              height: widget.width * 0.004,
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Maksimalus nuotraukų kiekis: ${GlobalConstants.maxAllowedImageCount}',
                                style: GoogleFonts.roboto(
                                  fontSize: widget.width * 0.009375,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0x660a3328),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: widget.width * 0.02,
                              child: TextFormField(
                                enabled: true,
                                maxLines: 1,
                                readOnly: true,
                                initialValue: " ",
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                textAlignVertical: TextAlignVertical.top,
                                validator: (value) {
                                  if (_selectedImages.isEmpty) {
                                    return 'Prašome įkelti bent 2 nuotraukas';
                                  } else {
                                    if (_selectedImages.length < 2) {
                                      return 'Prašome įkelti bent 2 nuotraukas';
                                    } else {
                                      return null;
                                    }
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: widget.width * 0.005,
                            ),
                            _selectedImages.isNotEmpty
                                ? SizedBox(
                                    width: widget.width / 2.4 * 0.9111,
                                    height: _selectedImages.length > 2
                                        ? widget.width / 2.4 * 0.9111
                                        : widget.width / 2.4 * 0.4555,
                                    child: AlignedGridView.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              getImageWidget(
                                                  _selectedImages,
                                                  widget.width /
                                                      2.4 *
                                                      0.4333)[index],
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, right: 5),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    removeSelectedImage(index);
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .remove_circle_outline_outlined,
                                                    color: Colors.white,
                                                    size: widget.width /
                                                        2.4 *
                                                        0.05,
                                                  ),
                                                ),
                                              )
                                            ]);
                                      },
                                      itemCount: getImageWidget(_selectedImages,
                                              widget.width / 2.4 * 0.4333)
                                          .length,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(height: widget.width * 0.01),
                            CheckboxListTile(
                              activeColor: const Color.fromRGBO(57, 97, 84, 1),
                              title: SizedBox(
                                width: widget.width * 0.2,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sutinku su departamento  ',
                                        style: GoogleFonts.roboto(
                                          fontSize: widget.width * 0.01,
                                          color: Colors.black,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          LaunchUrl().launch(
                                              'https://aad.lrv.lt/lt/administracine-informacija/asmens-duomenu-apsauga/');
                                        },
                                        child: Text(
                                          'Asmens duomenų apsaugos\n tvarkymo taisyklėmis',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontSize: widget.width * 0.01,
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              value: isTermsAccepted,
                              onChanged: (value) {
                                setState(() {
                                  isTermsAccepted = value!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.trailing,
                              subtitle: !isTermsAccepted
                                  ? Text(
                                      'Privaloma',
                                      style: TextStyle(
                                        color: const Color(0xFFe53935),
                                        fontSize: widget.width * 0.01,
                                      ),
                                    )
                                  : null,
                            ),
                            SizedBox(
                              height: widget.width * 0.01,
                            ),
                            MarkButtonMobile(
                              isActive: true,
                              width: widget.width / 3.5,
                              onTap: () async {
                                if (_formKey.currentState!.validate() &&
                                    selectedLat != 0 &&
                                    selectedLong != 0 &&
                                    isTermsAccepted &&
                                    _selectedImages.isNotEmpty) {
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
    );

    setState(() {
      markers.add(newMarker);
      addedMarker.add(newMarker);
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
    });
  }

  _handleDrag(LatLng tappedPoint) {
    setState(() {
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
    });
  }
}
