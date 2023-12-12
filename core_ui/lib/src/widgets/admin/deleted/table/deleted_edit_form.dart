import 'dart:typed_data';

import 'package:core/constants/global_constants.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/admin/admin_cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domain/domain.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../admin_restore_button.dart';
import '../../admin_save_button.dart';
import '../../historical_data/admin_history_button.dart';

class DeletedEditForm extends StatefulWidget {
  final ReportModel report;
  final VoidCallback onPressed;
  final Function(ReportModel, List<http.MultipartFile>) onUpdate;

  const DeletedEditForm({
    required this.report,
    required this.onPressed,
    required this.onUpdate,
    Key? key,
  }) : super(key: key);

  @override
  State<DeletedEditForm> createState() => _DeletedEditFormState();
}

class _DeletedEditFormState extends State<DeletedEditForm> {
  final _formKey = GlobalKey<FormState>();
  late ReportModel report;
  bool isMapHover = false;
  MapType currentMapType = MapType.normal;
  BitmapDescriptor trashMarkerIcon = BitmapDescriptor.defaultMarker;
  final Set<Marker> _trashMarker = {};
  final CameraPosition _lithuaniaCameraPosition =
      const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 6.8);
  static const List<String> dropdownItems = <String>[
    'gautas',
    'nepasitvirtino',
    'tiriamas',
    'ištirtas',
    'sutvarkyta',
  ];
  final List<ImageProvider> _imageProviders = [];
  final List<ImageProvider> _officerImageProviders = [];

  String currentText = '';
  String currentComment = '';
  String currentLong = '';
  String currentLat = '';
  String currentDate = '';
  String currentFormattedDate = '';
  String currentStatus = '';
  bool currentVisibility = false;

  List<List<int>>? _selectedImages;
  List<Uint8List>? _fileBytes;
  List<http.MultipartFile> multipartList = [];

  Future<void> getMultipleImageInfos() async {
    List<Uint8List>? images = await ImagePickerWeb.getMultiImagesAsBytes(
        GlobalConstants.maxAllowedImageCount);

    if (images != null) {
      setState(() async {
        _selectedImages = images;
        _fileBytes = images;
        multipartList.clear();
        for(var element in _selectedImages!){
          multipartList.add(http.MultipartFile.fromBytes('image', element,
              contentType: MediaType("image", "jpg"), filename: 'name.jpg'));
        }
      });
    }
  }

  @override
  void initState() {
    currentText = widget.report.name;
    currentComment = widget.report.comment ?? '';
    currentLong = widget.report.reportLong.toString();
    currentLat = widget.report.reportLat.toString();
    currentDate = widget.report.reportDate;
    currentFormattedDate = formatDate(widget.report.reportDate);
    currentStatus = widget.report.status;
    currentVisibility = widget.report.isVisible!;

    _trashMarker.add(
      Marker(
        markerId: MarkerId(
          currentText,
        ),
        position: LatLng(
          double.parse(currentLat),
          double.parse(currentLong),
        ),
        icon: trashMarkerIcon,
      ),
    );
    if (widget.report.imageUrls!.isNotEmpty) {
      for (var element in widget.report.imageUrls!) {
        if (element.endsWith('.heic') || element.endsWith('.heif')) {
          var convertedString = element.substring(0, element.length - 5);
          convertedString = '$convertedString.jpg';
          _imageProviders.add(Image.network(convertedString).image);
        } else {
          _imageProviders.add(Image.network(element).image);
        }
      }
    }
    if (widget.report.officerImageUrls!.isNotEmpty) {
      for (var element in widget.report.officerImageUrls!) {
        if (element.endsWith('.heic') || element.endsWith('.heif')) {
          var convertedString = element.substring(0, element.length - 5);
          convertedString = '$convertedString.jpg';
          _officerImageProviders.add(Image.network(convertedString).image);
        } else {
          _officerImageProviders.add(Image.network(element).image);
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: isMapHover ? const NeverScrollableScrollPhysics() : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: getBoxDecoration(),
                            width: constraints.maxWidth / 2,
                            height: constraints.maxWidth / 10,
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              maxLines: 5,
                              initialValue: currentText,
                              onChanged: (String nameValue) {
                                setState(() {
                                  currentText = nameValue;
                                });
                              },
                              style: getInputStyle(),
                              decoration:
                                  getLabelDecoration('Pranešimo turinys')
                                      .copyWith(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            decoration: getBoxDecoration(),
                            width: constraints.maxWidth / 2,
                            height: constraints.maxWidth / 16,
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              maxLines: 1,
                              initialValue: currentComment,
                              onChanged: (String commentValue) {
                                setState(() {
                                  currentComment = commentValue;
                                });
                              },
                              style: getInputStyle(),
                              decoration:
                                  getLabelDecoration('AAD Atsakymas').copyWith(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: getBoxDecoration(),
                                    width: constraints.maxWidth / 5,
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      initialValue: currentFormattedDate,
                                      enabled: false,
                                      style: getInputStyle(),
                                      decoration: getLabelDecoration(
                                          'Pranešimo data ir laikas'),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: getBoxDecoration(),
                                width: constraints.maxWidth / 5,
                                padding: const EdgeInsets.all(4),
                                child: Column(children: [
                                  Text(
                                    'Pranešimo statusas',
                                    style: GoogleFonts.roboto(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                  DropdownButton<String>(
                                    value: currentStatus,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_outlined),
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    underline: Container(
                                      height: 1,
                                      color: Colors.black54,
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        currentStatus = value!;
                                      });
                                    },
                                    items: dropdownItems
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: getBoxDecoration(),
                                width: constraints.maxWidth / 5,
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  initialValue: currentLong,
                                  enabled: false,
                                  onChanged: (String longValue) {
                                    setState(() {
                                      currentLong = longValue;
                                    });
                                  },
                                  style: getInputStyle(),
                                  decoration: getLabelDecoration(
                                      'Pranešimo koordinačių ilguma'),
                                ),
                              ),
                              Container(
                                decoration: getBoxDecoration(),
                                width: constraints.maxWidth / 5,
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                  initialValue: currentLat,
                                  enabled: false,
                                  style: getInputStyle(),
                                  decoration: getLabelDecoration(
                                      'Pranešimo koordinačių platuma'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AdminHistoryButton(
                                width: constraints.maxWidth,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                report: widget.report,
                              ),
                              Container(
                                decoration: getBoxDecoration(),
                                width: constraints.maxWidth / 5,
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pranešimas rodomas',
                                      style: GoogleFonts.roboto(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                    Checkbox(
                                        activeColor: Colors.green,
                                        value: currentVisibility,
                                        onChanged: (changeValue) {
                                          setState(() {
                                            currentVisibility = changeValue!;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxWidth * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Pranešimo nuotraukos',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                              height: constraints.maxWidth / 3.2,
                              width: constraints.maxWidth / 4,
                              child: _imageProviders.isNotEmpty
                                  ? GalleryImageView(
                                      listImage: _imageProviders,
                                      imageDecoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white)),
                                      galleryType: 2,
                                    )
                                  : Center(
                                      child: Text(
                                        'Nuotraukos nepateiktos',
                                        style: GoogleFonts.roboto(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    )),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Pareigūnų nuotraukos',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          _officerImageProviders.isNotEmpty
                              ? SizedBox(
                                  height: constraints.maxWidth / 3.5,
                                  width: constraints.maxWidth / 4,
                                  child: GalleryImageView(
                                    listImage: _officerImageProviders,
                                    imageDecoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white)),
                                    galleryType: 2,
                                  ),
                                )
                              : _fileBytes == null
                                  ? Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                constraints.maxWidth / 10),
                                        child: Text(
                                          'Nuotraukos nepateiktos',
                                          style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                          _officerImageProviders.isEmpty
                              ? _fileBytes != null
                                  ? ImageCollageMobile(
                                      width: constraints.maxWidth / 4,
                                      imageBytes: _fileBytes!,
                                    )
                                  : const SizedBox.shrink()
                              : const SizedBox.shrink(),
                          _officerImageProviders.isNotEmpty
                              ? const SizedBox.shrink()
                              : ImageAddButtonAdmin(
                                  width: constraints.maxWidth / 4,
                                  title: _fileBytes != null
                                      ? 'Keisti nuotraukas'
                                      : 'Įkelti nuotraukas',
                                  onTap: () {
                                    getMultipleImageInfos();
                                  }),
                        ],
                      ),
                      MouseRegion(
                        onEnter: (_) => setState(() {
                          isMapHover = true;
                        }),
                        onExit: (_) => setState(() {
                          isMapHover = false;
                        }),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: SizedBox(
                              height: constraints.maxWidth / 3,
                              width: constraints.maxWidth / 2.2,
                              child: GoogleMap(
                                  markers: _trashMarker,
                                  mapType: currentMapType,
                                  initialCameraPosition:
                                      _lithuaniaCameraPosition)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxWidth * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: getBoxDecoration(),
                        width: constraints.maxWidth / 3,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          initialValue: widget.report.email ?? '-',
                          enabled: false,
                          onChanged: (String longValue) {
                            setState(() {
                              currentLong = longValue;
                            });
                          },
                          style: getInputStyle(),
                          decoration:
                              getLabelDecoration('Pranešėjo el. paštas'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AdminCancelButton(
                              width: constraints.maxWidth,
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          SizedBox(width: constraints.maxWidth * 0.01),
                          AdminSaveButton(
                              width: constraints.maxWidth,
                              onPressed: () {
                                widget.onUpdate(
                                    ReportModel(
                                        id: widget.report.id,
                                        name: currentText,
                                        type: widget.report.type,
                                        comment: currentComment,
                                        reportLong: double.parse(currentLong),
                                        reportLat: double.parse(currentLat),
                                        reportDate: widget.report.reportDate,
                                        isVisible: currentVisibility,
                                        status: currentStatus,
                                        isDeleted: true,
                                        refId: ''),
                                    multipartList);
                              }),
                          SizedBox(width: constraints.maxWidth * 0.01),
                          AdminRestoreButton(
                              width: constraints.maxWidth,
                              onPressed: () {
                                widget.onUpdate(
                                    ReportModel(
                                      id: widget.report.id,
                                      name: widget.report.name,
                                      type: widget.report.type,
                                      comment: widget.report.comment,
                                      reportLong: widget.report.reportLong,
                                      reportLat: widget.report.reportLat,
                                      reportDate: widget.report.reportDate,
                                      isVisible: widget.report.isVisible,
                                      status: widget.report.status,
                                      isDeleted: false,
                                      refId: widget.report.refId,
                                    ),
                                    multipartList);
                              }),
                        ],
                      ),
                      MapTypeSwitcher(
                          width: constraints.maxWidth,
                          onMapTypeChange: (mapType) {
                            setState(() {
                              currentMapType = mapType;
                            });
                          },
                          currentMapType: currentMapType)
                    ],
                  ),
                  SizedBox(height: constraints.maxWidth * 0.01),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String formatDate(String unformattedDate) {
    DateTime formattedDate =
        DateTime.parse(unformattedDate).add(const Duration(hours: 3));
    String day = formattedDate.toString().substring(0, 10);
    String hour = formattedDate.toString().substring(11, 16);
    return '$day $hour';
  }

  TextStyle getInputStyle() {
    return GoogleFonts.roboto(fontSize: 20, color: Colors.black);
  }

  InputDecoration getLabelDecoration(String labelText) {
    return InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreenAccent)),
        labelText: labelText,
        labelStyle: GoogleFonts.roboto(fontSize: 15, color: Colors.black54));
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: const Color.fromRGBO(225, 225, 225, 0.7),
      border:
          Border.all(width: 2, color: const Color.fromRGBO(51, 114, 0, 1.0)),
    );
  }
}
