import 'package:api_client/api_client.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart' as dio;
import 'package:core_ui/core_ui.dart';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:core/core.dart';
import 'add_pin_screen_mobile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AddingScreenMobile extends StatefulWidget {
  const AddingScreenMobile({
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
  State<AddingScreenMobile> createState() => _AddingScreenMobileState();
}

class _AddingScreenMobileState extends State<AddingScreenMobile> {
  final List<List<int>> _selectedImages = [];
  final List<Uint8List> _fileBytes = [];
  List<dio.MultipartFile> multipartList = [];

  Future<void> getMultipleImageInfos() async {
    List<Uint8List>? images = await ImagePickerWeb.getMultiImagesAsBytes(
        GlobalConstants.maxAllowedImageCount);

    if (images != null) {
      setState(() async {
        _selectedImages.addAll(images);
        _fileBytes.addAll(images);
        for (var element in _selectedImages) {
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
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  final _formKey = GlobalKey<FormState>();
  String currentTextValue = '';
  String currentEmailValue = '';
  Set<Marker> markers = {};
  List<Marker> newMarkers = [];
  Set<Marker> newMarker = {};
  double selectedLat = 0;
  double selectedLong = 0;
  List<DropdownMenuItem<String>> dropDownItems = [];
  late String currentItem;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/svg/pin_icon.svg')
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
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
    currentItem = 'Šiukšlinimas gamtoje';
    dropDownItems.add(DropdownMenuItem(
      value: 'Šiukšlinimas gamtoje',
      child: Text(
        'Šiukšlinimas gamtoje',
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: widget.width * 0.03888,
          color: const Color.fromRGBO(57, 97, 84, 1),
        ),
      ),
    ));
    super.initState();
  }

  void removeSelectedImage(int imageIndex) {
    setState(() {
      _fileBytes.removeAt(imageIndex);
      _selectedImages.removeAt(imageIndex);
      multipartList.removeAt(imageIndex);
    });
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
                child: ListView(
                    padding: EdgeInsets.all(widget.width * 0.0555),
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pranešti apie šiukšlinimą',
                            style: GoogleFonts.roboto(
                              fontSize: widget.width * 0.04444,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.goNamed("home");
                            },
                            child: Icon(
                              Icons.close,
                              size: widget.width * 0.0533,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: widget.width * 0.0611),
                      AddingInformationHeader(width: widget.width),
                      SizedBox(height: widget.width * 0.0444),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          AddingMapRedirectWindow(
                            width: widget.width,
                            marker: newMarker,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (newMarker.isNotEmpty) {
                                  newMarker.removeWhere((element) =>
                                      element.markerId ==
                                      const MarkerId('99899'));
                                  markers.removeWhere((element) =>
                                      element.markerId ==
                                      const MarkerId('99899'));
                                }
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPinScreenMobile(
                                          width: widget.width,
                                          markers: markers,
                                          onTap: (lat, long, marker) {
                                            setState(() {
                                              newMarker.clear();
                                              selectedLat = lat;
                                              selectedLong = long;
                                              newMarker.add(marker);
                                            });
                                          },
                                        )),
                              );
                            },
                            onHover: (isHover) {},
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: widget.width * 0.0278),
                                child: Container(
                                  height: widget.width * 0.111,
                                  width: widget.width * 0.866,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_location_sharp,
                                        size: widget.width * 0.0566,
                                        color: const Color.fromRGBO(
                                            255, 106, 61, 1),
                                      ),
                                      SizedBox(width: widget.width * 0.0277),
                                      Text(
                                        'Pažymėkite vietą, kur aptikote šiukšles',
                                        style: GoogleFonts.roboto(
                                            fontSize: widget.width * 0.038888,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: widget.width * 0.05),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pranešimo turinys',
                          style: GoogleFonts.roboto(
                              fontSize: widget.width * 0.03888,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: widget.width * 0.0138),
                      Container(
                        width: widget.width * 0.911,
                        height: widget.width * 0.333,
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.width * 0.033,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
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
                                fontWeight: FontWeight.w400,
                                fontSize: widget.width * 0.03333,
                                color: Colors.black),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: widget.width * 0.0444),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Jūsų el. paštas',
                          style: GoogleFonts.roboto(
                              fontSize: widget.width * 0.03888,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: widget.width * 0.0111),
                      Container(
                        width: widget.width * 0.911,
                        height: widget.width * 0.111,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.width * 0.033,
                        ),
                        child: Center(
                          child: TextFormField(
                            maxLines: 1,
                            textAlignVertical: TextAlignVertical.center,
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
                                fontWeight: FontWeight.w400,
                                fontSize: widget.width * 0.03333,
                                color: Colors.black),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: widget.width * 0.0444),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Įkelkite bent 2 pažeidimo nuotraukas',
                          style: GoogleFonts.roboto(
                              fontSize: widget.width * 0.03888,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: widget.width * 0.0111),
                      ImageAddButtonMobile(
                          width: widget.width,
                          title: _fileBytes.isNotEmpty
                              ? 'Įkelti kitas nuotraukas'
                              : 'Įkelti nuotraukas',
                          onTap: () {
                            getMultipleImageInfos();
                          }),
                      SizedBox(height: widget.width * 0.0133),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Maksimalus nuotraukų kiekis: 4',
                          style: GoogleFonts.roboto(
                              fontSize: widget.width * 0.03333,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: widget.width * 0.05,
                        width: widget.width * 0.911,
                        child: TextFormField(
                          enabled: true,
                          maxLines: 1,
                          readOnly: true,
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
                      // _fileBytes.isNotEmpty
                      //     ? ImageCollageMobile(
                      //         width: widget.width,
                      //         imageBytes: _fileBytes,
                      //         onTap: (index) {
                      //           setState(() {
                      //             _fileBytes.removeAt(index);
                      //             _selectedImages.removeAt(index);
                      //             multipartList.removeAt(index);
                      //           });
                      //         },
                      //       )
                      //     : const SizedBox.shrink(),
                      _fileBytes.isNotEmpty
                          ? SizedBox(
                              width: widget.width * 0.9111,
                              height: _fileBytes.length > 2
                                  ? widget.width * 0.9111
                                  : widget.width * 0.4555,
                              child: AlignedGridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        getImageWidget(_fileBytes,
                                            widget.width * 0.4333)[index],
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
                                              size: widget.width * 0.05,
                                            ),
                                          ),
                                        )
                                      ]);
                                },
                                itemCount: getImageWidget(
                                        _fileBytes, widget.width * 0.4333)
                                    .length,
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(height: widget.width * 0.0488),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pranešimo kategorija',
                          style: GoogleFonts.roboto(
                              fontSize: widget.width * 0.03888,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: widget.width * 0.0133),
                      Container(
                        width: widget.width * 0.911,
                        height: widget.width * 0.111,
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.width * 0.05),
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
                              size: widget.width * 0.05,
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
                      SizedBox(height: widget.width * 0.03333),
                      SizedBox(
                        width: widget.width,
                        child: CheckboxListTile(
                          activeColor: const Color.fromRGBO(57, 97, 84, 1),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sutinku su  ',
                                style: GoogleFonts.roboto(
                                  fontSize: widget.width * 0.033,
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
                                  'Asmens duomenų apsaugos\ntvarkymo taisyklėmis',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    fontSize: widget.width * 0.033,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          value: isTermsAccepted,
                          onChanged: (value) {
                            setState(() {
                              isTermsAccepted = value!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          subtitle: !isTermsAccepted
                              ? Text(
                                  'Privaloma',
                                  style: TextStyle(
                                    color: const Color(0xFFe53935),
                                    fontSize: widget.width * 0.03,
                                  ),
                                )
                              : null,
                        ),
                      ),
                      SizedBox(height: widget.width * 0.0488),
                      MarkButtonMobile(
                        isActive: true,
                        width: widget.width,
                        onTap: () async {
                          if (_formKey.currentState!.validate() &&
                              selectedLat != 0 &&
                              selectedLong != 0 &&
                              isTermsAccepted &&
                              multipartList.isNotEmpty) {
                            if (multipartList.length >= 2) {
                              widget.onAddTap(
                                currentEmailValue,
                                currentTextValue,
                                selectedLat,
                                selectedLong,
                                multipartList,
                              );
                            }

                            //TODO: FIX CAPTCHA
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return CaptchaDialog(
                            //         onSuccess: () async {
                            //           await Future.delayed(
                            //               const Duration(seconds: 1));
                            //           Navigator.of(context).pop();
                            //           widget.onAddTap(
                            //             currentEmailValue,
                            //             currentTextValue,
                            //             selectedLat,
                            //             selectedLong,
                            //             multipartList,
                            //           );
                            //         },
                            //       );
                            //     });
                          }
                        },
                      ),
                    ]));
          },
        ),
      ),
    );
  }
}
