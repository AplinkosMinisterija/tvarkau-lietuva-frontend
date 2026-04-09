import 'dart:typed_data';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:core/utils/extensions.dart';
import 'package:api_client/api_client.dart';
import 'package:core/utils/image_display/image_display.dart';
import 'package:core/utils/permit.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/base_dump_info.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_switch.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/dump_tabs.dart';

class AnalyticsWindow extends StatefulWidget {
  final ReportCategoryAnalyticsDto? analytics;
  final VoidCallback onBackPress;
  final Function(
          String dateFrom, String dateTo, String? status, String? category)
      onLoadAnalytics;

  const AnalyticsWindow({
    this.analytics,
    required this.onBackPress,
    required this.onLoadAnalytics,
    super.key,
  });

  @override
  State<AnalyticsWindow> createState() => _AnalyticsWindowState();
}

class _AnalyticsWindowState extends State<AnalyticsWindow> {
  bool isVisible = false;
  String? dateFrom;
  String? dateTo;
  String? status;
  String? category;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return BaseAdminScreen(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: width,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  42.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextButton(
                      onPressed: widget.onBackPress,
                      text: 'Grįžti atgal',
                      icon: Icons.arrow_back,
                    ),
                  ),
                  17.heightBox,
                  Row(
                    children: [
                      Text('Statistika', style: CustomStyles.h2),
                    ],
                  ),
                  48.heightBox,
                  _buildDesktopLayout(
                    widget.analytics,
                    width,
                    widget.onLoadAnalytics,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(
      ReportCategoryAnalyticsDto? analytics,
      double width,
      Function(String dateFrom, String dateTo, String? status, String? category)
          onLoadAnalytics) {

    return SizedBox();
  }
}

class _BuildMap extends StatefulWidget {
  const _BuildMap({
    required this.height,
    required this.markers,
    required this.initialTarget,
    required this.permits,
  });

  final double height;
  final Set<Marker> markers;
  final LatLng initialTarget;
  final List<Permit>? permits;

  @override
  State<_BuildMap> createState() => _BuildMapState();
}

class _BuildMapState extends State<_BuildMap> {
  Set<Polygon> polygons = {};

  @override
  void initState() {
    if (widget.permits != null) {
      mapPolygons(widget.permits!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height.toDouble(),
      child: GoogleMap(
        mapType: MapType.none,
        markers: widget.markers,
        polygons: polygons,
        initialCameraPosition: CameraPosition(
          target: widget.initialTarget,
          zoom: 13,
        ),
      ),
    );
  }

  Future<void> mapPolygons(List<Permit> permits) async {
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
            showDialog(
                context: context,
                barrierColor: Colors.white.withOpacity(0),
                builder: (context) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Material(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: InfoPermitWindowBox(
                          width: 1200,
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

class _BuildAadisSection extends StatefulWidget {
  const _BuildAadisSection({
    required this.report,
    required this.onTransfer,
  });

  final FullReportDto report;
  final Function(String refId, String name, double longitude, double latitude,
      String status, DateTime reportDate, String email) onTransfer;

  @override
  State<_BuildAadisSection> createState() => _BuildAadisSectionState();
}

class _BuildAadisSectionState extends State<_BuildAadisSection> {
  String selectedItem = '';
  Map<String, String> itemList = {};

  @override
  void initState() {
    if (widget.report.isTransferred != true) {
      itemList = getEmployeeList(widget.report.category);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.report.isTransferred != true
        ? Column(
            children: [
              SizedBox(
                height: 100,
                child: CustomDropdown<String>(
                  hintText: 'Pasirinkite savivaldybę',
                  overlayHeight: 250,
                  decoration: CustomDropdownDecoration(
                    listItemStyle: GoogleFonts.roboto(fontSize: 13),
                    closedBorder: Border.all(color: Colors.black, width: 1),
                    expandedBorder: Border.all(color: Colors.black, width: 1),
                    hintStyle: GoogleFonts.roboto(fontSize: 13),
                    headerStyle: GoogleFonts.roboto(fontSize: 13),
                  ),
                  items: itemList.keys.toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedItem = itemList[value] ?? '';
                    });
                  },
                ),
              ),
              CustomButton(
                text: 'Siųsti į AADIS',
                buttonType: ButtonType.outlined,
                color: selectedItem != ''
                    ? CustomColors.primary
                    : CustomColors.primaryLight,
                onPressed: selectedItem != ''
                    ? () {
                        widget.onTransfer(
                            widget.report.refId,
                            widget.report.name,
                            widget.report.longitude,
                            widget.report.latitude,
                            widget.report.status,
                            widget.report.reportDate,
                            selectedItem);
                      }
                    : null,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

Map<String, String> getEmployeeList(FullReportDtoCategoryEnum category) {
  const trashList = {
    'Alytus': 'reda.baubliene@aad.am.lt',
    'Kaunas': 'rasa.zitkeviciute@aad.am.lt',
    'Klaipėda': 'laura.dagiliene@aad.am.lt',
    'Gargždai': 'martinas.duobinis@aad.am.lt',
    'Marijampolė': 'algimantas.paplauskas@aad.am.lt',
    'Šilutė': 'galina.miseviciene@aad.am.lt',
    'Jūros AAS': 'vidmantas.tilvikas@aad.am.lt',
    'Biržai': 'elona.pipiraite@aad.am.lt',
    'Panevėžys': 'ieva.jakupkaite@aad.am.lt',
    'Ignalina': 'viktoras.ksenzovas@aad.am.lt',
    'Utena': 'eimantas.puodziukas@aad.am.lt',
    'Pakruojis': 'robertas.jagminas@aad.am.lt',
    'Šiauliai': 'valdas.glazauskis@aad.am.lt',
    'Telšiai': 'renata.stankuviene@aad.am.lt',
    'Trakai': 'egidijus.kirkliauskas@aad.am.lt',
    'Vilniaus miestas': 'edgaras.skrebe@aad.am.lt',
    'Vilniaus rajonas': 'pavel.jakubovskij@aad.am.lt',
    'Kauno MKS': 'gintaras.zukauskas@aad.am.lt',
    'Vilniaus MKS': 'marijonas.juskauskas@aad.am.lt',
    'Klaipėdos MKS': 'robertas.paulauskas@aad.am.lt',
    'Panevėžio MKS': 'albertas.mikasauskas@aad.am.lt',
  };
  return trashList;
}
