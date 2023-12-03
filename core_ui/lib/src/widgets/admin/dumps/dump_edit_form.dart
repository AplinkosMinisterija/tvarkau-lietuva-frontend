import 'package:api_client/api_client.dart';
import 'package:core_ui/src/widgets/admin/admin_cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domain/domain.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../admin_save_button.dart';

class DumpEditForm extends StatefulWidget {
  final FullDumpDto report;
  final VoidCallback onPressed;
  final Function(ReportModel) onUpdate;

  const DumpEditForm({
    required this.report,
    required this.onPressed,
    required this.onUpdate,
    Key? key,
  }) : super(key: key);

  @override
  State<DumpEditForm> createState() => _DumpEditFormState();
}

class _DumpEditFormState extends State<DumpEditForm> {
  final _formKey = GlobalKey<FormState>();
  late ReportModel report;
  bool isMapHover = false;
  BitmapDescriptor trashMarkerIcon = BitmapDescriptor.defaultMarker;
  final Set<Marker> _trashMarker = {};
  final CameraPosition _lithuaniaCameraPosition =
      const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 6.8);

  String currentName = '';
  String currentPhone = '';
  String currentWorkingHours = '';
  String currentInformation = '';
  bool currentVisibility = false;

  @override
  void initState() {
    currentName = widget.report.name;
    currentPhone = widget.report.phone ?? '-';
    currentWorkingHours = widget.report.workingHours ?? '-';
    currentInformation = widget.report.moreInformation ?? '-';
    currentVisibility = widget.report.isVisible!;

    _trashMarker.add(
      Marker(
        markerId: MarkerId(
          currentName,
        ),
        position: LatLng(
          widget.report.latitude.toDouble(),
          widget.report.longitude.toDouble(),
        ),
        icon: trashMarkerIcon,
      ),
    );
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: getBoxDecoration(),
                          width: constraints.maxWidth / 5,
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            maxLines: 2,
                            initialValue: currentName,
                            onChanged: (String nameValue) {
                              setState(() {
                                currentName = nameValue;
                              });
                            },
                            style: getInputStyle(),
                            decoration:
                                getLabelDecoration('Aikštelės pavadinimas')
                                    .copyWith(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          decoration: getBoxDecoration(),
                          width: constraints.maxWidth / 5,
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            maxLines: 2,
                            initialValue: currentInformation,
                            onChanged: (String infoValue) {
                              setState(() {
                                currentInformation = infoValue;
                              });
                            },
                            style: getInputStyle(),
                            decoration:
                                getLabelDecoration('Aikštelės informacija')
                                    .copyWith(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: getBoxDecoration(),
                      width: constraints.maxWidth / 5,
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        maxLines: 2,
                        initialValue: currentPhone,
                        onChanged: (String phoneValue) {
                          setState(() {
                            currentPhone = phoneValue;
                          });
                        },
                        style: getInputStyle(),
                        decoration:
                            getLabelDecoration('Telefono numeris').copyWith(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxWidth * 0.005),
                    Container(
                      decoration: getBoxDecoration(),
                      height: constraints.maxWidth / 6,
                      width: constraints.maxWidth / 2.2,
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        maxLines: 7,
                        initialValue: currentWorkingHours,
                        onChanged: (String hoursValue) {
                          setState(() {
                            currentWorkingHours = hoursValue;
                          });
                        },
                        style: getInputStyle(),
                        decoration:
                            getLabelDecoration('Darbo valandos').copyWith(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxWidth * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AdminCancelButton(
                            width: constraints.maxWidth,
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        SizedBox(width: constraints.maxWidth * 0.05),
                        AdminSaveButton(
                            width: constraints.maxWidth,
                            onPressed: () {
                              widget.onUpdate(
                                ReportModel(
                                  id: widget.report.refId,
                                  name: currentName,
                                  type: widget.report.type,
                                  reportLong: widget.report.longitude.toDouble(),
                                  reportLat: widget.report.latitude.toDouble(),
                                  reportDate: '',
                                  isVisible: currentVisibility,
                                  status: '',
                                  moreInformation: currentInformation,
                                  workingHours: currentWorkingHours,
                                  phone: currentPhone,
                                  isDeleted: false,
                                  refId: null,
                                ),
                              );
                            })
                      ],
                    ),
                    SizedBox(height: constraints.maxWidth * 0.01),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: getBoxDecoration(),
                          width: constraints.maxWidth / 5,
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            initialValue: widget.report.longitude.toString(),
                            enabled: false,
                            style: getInputStyle(),
                            decoration: getLabelDecoration('Aikštelės ilguma'),
                          ),
                        ),
                        Container(
                          decoration: getBoxDecoration(),
                          width: constraints.maxWidth / 5,
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            initialValue: widget.report.latitude.toString(),
                            enabled: false,
                            style: getInputStyle(),
                            decoration: getLabelDecoration('Aikštelės platuma'),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: getBoxDecoration(),
                      width: constraints.maxWidth / 5,
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                initialCameraPosition:
                                    _lithuaniaCameraPosition)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
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
