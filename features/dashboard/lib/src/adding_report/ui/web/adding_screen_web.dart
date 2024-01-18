import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:core_ui/core_ui.dart';
import 'package:latlong2/latlong.dart';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AddingScreenWeb extends StatefulWidget {
  const AddingScreenWeb({
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
  final Function(String, String, double, double, List<dio.MultipartFile>)
      onAddTap;
  final VoidCallback onDataSecurityTap;

  @override
  State<AddingScreenWeb> createState() => _AddingScreenWebState();
}

class _AddingScreenWebState extends State<AddingScreenWeb> {
  static const double _locationMarkerSize = 50;
  final List<List<int>> _selectedImages = [];
  final List<Uint8List> _fileBytes = [];
  List<dio.MultipartFile> multipartList = [];

  Future<void> getMultipleImageInfos() async {
    List<Uint8List>? images = await ImagePickerWeb.getMultiImagesAsBytes(
        GlobalConstants.maxAllowedImageCount);

    if (images != null) {
      setState(() {
        _selectedImages.addAll(images);
        _fileBytes.addAll(images);
        for (var element in _selectedImages) {
          //http.MultipartFile.fromBytes(field, value)
          multipartList.add(dio.MultipartFile.fromBytes(element,
              contentType: MediaType("image", "jpg"), filename: 'name.jpg'));
        }
        if (_selectedImages.length > 4 && _selectedImages.isNotEmpty) {
          for (int i = 0; i < _selectedImages.length - 4; i++) {
            _selectedImages.removeAt(0);
            _fileBytes.removeAt(0);
            multipartList.removeAt(0);
          }
        }
      });
    }
  }

  bool isTermsAccepted = false;
  final _formKey = GlobalKey<FormState>();
  bool isShowMarkers = true;
  bool isMapDisabled = false;
  String currentTextValue = '';
  String currentEmailValue = '';
  LatLng selectedPosition = GlobalConstants.lithuaniaCenterLatLng;
  List<DropdownMenuItem<String>> dropDownItems = [];
  late String currentItem;

  LatLng? _currentPosition;
  bool _isLoading = false;

  void removeSelectedImage(int imageIndex) {
    setState(() {
      _fileBytes.removeAt(imageIndex);
      _selectedImages.removeAt(imageIndex);
      multipartList.removeAt(imageIndex);
    });
  }

  @override
  void initState() {
    currentItem = 'Šiukšlinimas gamtoje';
    dropDownItems.add(DropdownMenuItem(
      value: 'Šiukšlinimas gamtoje',
      child: Text(
        'Šiukšlinimas gamtoje',
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: widget.width * 0.01888,
          color: const Color.fromRGBO(57, 97, 84, 1),
        ),
      ),
    ));
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
        selectedPosition = _currentPosition = LatLng(
          position.latitude,
          position.longitude,
        );
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Pranešti apie šiukšlinimą",
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
                                  const Opacity(
                                    opacity: 0.5,
                                    child: AppMap(
                                      disableInteractiveMap: true,
                                      layers: [],
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
                                  AppMap(
                                    initialCenter: _currentPosition,
                                    onPositionChanged: (position, _) {
                                      final latLng = position.center;
                                      if (latLng != null) {
                                        onPositionChanged(latLng);
                                      }
                                    },
                                    layers: [
                                      if (isShowMarkers)
                                        PublicReportsLayer(
                                          reports: widget.reports,
                                        ),
                                      SingleMarkerLayer(
                                        width: _locationMarkerSize,
                                        height: _locationMarkerSize,
                                        point: selectedPosition,
                                        alignment: Alignment.bottomCenter,
                                        child:
                                            MarkerIconFactory.reportDefault(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                      ),
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
                                title: _fileBytes.isNotEmpty
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
                                  if (_fileBytes.isEmpty) {
                                    return 'Prašome įkelti bent 2 nuotraukas';
                                  } else {
                                    if (_fileBytes.length < 2) {
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
                            // _fileBytes.isNotEmpty
                            //     ? ImageCollageMobile(
                            //         width: widget.width / 2.4,
                            //         imageBytes: _fileBytes,
                            //         onTap: (index) {
                            //           removeSelectedImage(index);
                            //         },
                            //       )
                            //     : const SizedBox.shrink(),
                            _fileBytes.isNotEmpty
                                ? SizedBox(
                                    width: widget.width / 2.4 * 0.9111,
                                    height: _fileBytes.length > 2
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
                                                  _fileBytes,
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
                                      itemCount: getImageWidget(_fileBytes,
                                              widget.width / 2.4 * 0.4333)
                                          .length,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(height: widget.width * 0.005),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Pranešimo kategorija',
                                style: GoogleFonts.roboto(
                                  fontSize: widget.width * 0.01145,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0x660a3328),
                                ),
                              ),
                            ),
                            SizedBox(height: widget.width * 0.01),
                            Container(
                              width: widget.width * 0.45,
                              height: widget.width * 0.045,
                              padding: EdgeInsets.symmetric(
                                  horizontal: widget.width * 0.01),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: const Color.fromRGBO(57, 97, 84, 1),
                                    width: 1),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    size: widget.width * 0.02,
                                    color: const Color.fromRGBO(57, 97, 84, 1),
                                  ),
                                  value: currentItem,
                                  autofocus: false,
                                  focusColor: Colors.transparent,
                                  isExpanded: true,
                                  items: dropDownItems,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
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
                                        //widget.onDataSecurityTap,
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
                                    isTermsAccepted &&
                                    multipartList.isNotEmpty) {
                                  if (multipartList.length >= 2) {
                                    widget.onAddTap(
                                      currentEmailValue,
                                      currentTextValue,
                                      selectedPosition.latitude,
                                      selectedPosition.longitude,
                                      multipartList,
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

  onPositionChanged(LatLng selectedPosition) {
    setState(() {
      this.selectedPosition = selectedPosition;
    });
  }
}
