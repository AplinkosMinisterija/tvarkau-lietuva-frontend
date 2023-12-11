import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';
import '../widgets/admin_table.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/custom_switch.dart';
import '../widgets/header.dart';
import '../widgets/updated_admin_view_type_switch.dart';
import '../widgets/updated_report_type_switch.dart';

class UpdatedAdminScreen extends StatefulWidget {
  const UpdatedAdminScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatedAdminScreen> createState() => _UpdatedAdminScreenState();
}

class _UpdatedAdminScreenState extends State<UpdatedAdminScreen> {
  final name = 'Vardas Pavardė';

  final email = 'vardas.pavarde@gmail.com';

  List<ReportModel> get mockReportModels => [
        ReportModel(
          id: "1",
          name: "Pirmas ataskaitos modelis",
          type: "Eismo įvykis",
          reportLong: 23.279652,
          reportLat: 54.687157,
          reportDate: "2021-07-20",
          isVisible: true,
          isDeleted: false,
          email: "pavyzdys@el.pastas.lt",
          address: "Vilnius, Lietuva",
          refId: "REF123",
          status: "gautas",
          phone: "+37061234567",
          comment:
              "Šiandien, apsilankius miške, pastebėjau išmestus šiferio lakštus. Jų gana nemažas kiekis, maždaug apie 100 lakštų. Jie išmėtyti po gana didelę teritoriją. Kartu su šiferio lakštais yra išmesti ir seni baldai bei buitinė technika.",
          workingHours: "I-V 8:00-17:00",
          moreInformation: "Papildoma informacija",
          imageUrls: [
            "https://nuoroda.lt/nuotrauka1.jpg",
            "https://nuoroda.lt/nuotrauka2.jpg",
          ],
          officerImageUrls: [
            "https://nuoroda.lt/policijos_nuotrauka1.jpg",
          ],
          historyData: [
            HistoryData(
              user: "Vartotojas1",
              date: "2021-07-21",
              edits: [
                Edits(field: "status", change: "Naujas statusas"),
                Edits(field: "komentaras", change: "Atnaujintas komentaras"),
              ],
            ),
          ],
          statusRecords: [
            StatusRecords(status: "Naujas", date: "2021-07-20"),
            StatusRecords(status: "Aptarnaujama", date: "2021-07-21"),
          ],
        ),
        // ... Two more ReportModel instances
      ];
  List<ReportModel> get mockDumpModels => [
        ReportModel(
          id: "1",
          name: "Pirmas ataskaitos modelis",
          type: "Eismo įvykis",
          reportLong: 24.279652,
          reportLat: 54.687157,
          reportDate: "2021-07-20",
          isVisible: true,
          isDeleted: false,
          email: "pavyzdys@el.pastas.lt",
          address: "Vilnius, Lietuva",
          refId: "REF123",
          status: "gautas",
          phone: "+37061234567",
          comment:
              "Šiandien, apsilankius miške, pastebėjau išmestus šiferio lakštus. Jų gana nemažas kiekis, maždaug apie 100 lakštų. Jie išmėtyti po gana didelę teritoriją. Kartu su šiferio lakštais yra išmesti ir seni baldai bei buitinė technika.",
          workingHours: "I-V 8:00-17:00",
          moreInformation: "Papildoma informacija",
          imageUrls: [
            "https://nuoroda.lt/nuotrauka1.jpg",
            "https://nuoroda.lt/nuotrauka2.jpg",
          ],
          officerImageUrls: [
            "https://nuoroda.lt/policijos_nuotrauka1.jpg",
          ],
          historyData: [
            HistoryData(
              user: "Vartotojas1",
              date: "2021-07-21",
              edits: [
                Edits(field: "status", change: "Naujas statusas"),
                Edits(field: "komentaras", change: "Atnaujintas komentaras"),
              ],
            ),
          ],
          statusRecords: [
            StatusRecords(status: "Naujas", date: "2021-07-20"),
            StatusRecords(status: "Aptarnaujama", date: "2021-07-21"),
          ],
        ),
        ReportModel(
          id: "2",
          name: "Pirmas ataskaitos modelis",
          type: "Eismo įvykis",
          reportLong: 25.279652,
          reportLat: 54.687157,
          reportDate: "2021-07-20",
          isVisible: true,
          isDeleted: false,
          email: "pavyzdys@el.pastas.lt",
          address: "Vilnius, Lietuva",
          refId: "REF123",
          status: "gautas",
          phone: "+37061234567",
          comment:
              "Šiandien, apsilankius miške, pastebėjau išmestus šiferio lakštus. Jų gana nemažas kiekis, maždaug apie 100 lakštų. Jie išmėtyti po gana didelę teritoriją. Kartu su šiferio lakštais yra išmesti ir seni baldai bei buitinė technika.",
          workingHours: "I-V 8:00-17:00",
          moreInformation: "Papildoma informacija",
          imageUrls: [
            "https://nuoroda.lt/nuotrauka1.jpg",
            "https://nuoroda.lt/nuotrauka2.jpg",
          ],
          officerImageUrls: [
            "https://nuoroda.lt/policijos_nuotrauka1.jpg",
          ],
          historyData: [
            HistoryData(
              user: "Vartotojas1",
              date: "2021-07-21",
              edits: [
                Edits(field: "status", change: "Naujas statusas"),
                Edits(field: "komentaras", change: "Atnaujintas komentaras"),
              ],
            ),
          ],
          statusRecords: [
            StatusRecords(status: "Naujas", date: "2021-07-20"),
            StatusRecords(status: "Aptarnaujama", date: "2021-07-21"),
          ],
        ),
        ReportModel(
          id: "3",
          name: "Pirmas ataskaitos modelis",
          type: "Eismo įvykis",
          reportLong: 26.279652,
          reportLat: 54.687157,
          reportDate: "2021-07-20",
          isVisible: true,
          isDeleted: false,
          email: "pavyzdys@el.pastas.lt",
          address: "Vilnius, Lietuva",
          refId: "REF123",
          status: "gautas",
          phone: "+37061234567",
          comment:
              "Šiandien, apsilankius miške, pastebėjau išmestus šiferio lakštus. Jų gana nemažas kiekis, maždaug apie 100 lakštų. Jie išmėtyti po gana didelę teritoriją. Kartu su šiferio lakštais yra išmesti ir seni baldai bei buitinė technika.",
          workingHours: "I-V 8:00-17:00",
          moreInformation: "Papildoma informacija",
          imageUrls: [
            "https://nuoroda.lt/nuotrauka1.jpg",
            "https://nuoroda.lt/nuotrauka2.jpg",
          ],
          officerImageUrls: [
            "https://nuoroda.lt/policijos_nuotrauka1.jpg",
          ],
          historyData: [
            HistoryData(
              user: "Vartotojas1",
              date: "2021-07-21",
              edits: [
                Edits(field: "status", change: "Naujas statusas"),
                Edits(field: "komentaras", change: "Atnaujintas komentaras"),
              ],
            ),
          ],
          statusRecords: [
            StatusRecords(status: "Naujas", date: "2021-07-20"),
            StatusRecords(status: "Aptarnaujama", date: "2021-07-21"),
          ],
        ),
        // ... Two more ReportModel instances
      ];

  bool isShowDumps = true;
  bool isMapView = false;
  bool isShowDeleted = false;
  Set<Marker> reportMarkers = {};
  Set<Marker> dumpMarkers = {};

  Future<void> setupMarker() async {
    final description = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50, 50)),
        'assets/svg/pin_icon.svg');

    for (final report in mockReportModels) {
      reportMarkers.add(Marker(
        markerId: MarkerId(report.id),
        position: LatLng(report.reportLat, report.reportLong),
        icon: description,
        onTap: () {
          context.goNamed('report_admin',
              extra: report, pathParameters: {'id': report.id});
        },
      ));
    }
    for (final dump in mockDumpModels) {
      dumpMarkers.add(Marker(
        markerId: MarkerId(dump.id),
        position: LatLng(dump.reportLat, dump.reportLong),
        icon: description,
        onTap: () {
          context.goNamed('dump', extra: dump, pathParameters: {'id': dump.id});
        },
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    setupMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        const minHeight = 300;
        final height = constraints.maxHeight * .6 > minHeight
            ? constraints.maxHeight * .6
            : minHeight;
        return BaseAdminScreen(
            child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 1300,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    email: email,
                    name: name,
                    onLogout: () {
                      //TODO: Add logout logic
                    },
                  ),
                  48.heightBox,
                  Text("Administracinė konsolė", style: CustomStyles.h2),
                  40.heightBox,
                  Row(
                    children: [
                      UpdatedReportTypeSwitch(
                        isShowDumps: isShowDumps,
                        onReportTypeChange: (value) {
                          setState(() {
                            isShowDumps = value;
                          });
                        },
                      ),
                      20.widthBox,
                      CustomSwitch(
                        value: isShowDeleted,
                        width: 64,
                        height: 32,
                        activeThumbColor: CustomColors.orange,
                        activeTrackColor: CustomColors.white,
                        inactiveTrackColor: CustomColors.white.withOpacity(.1),
                        inactiveThumbColor:
                            CustomColors.primary.withOpacity(.4),
                        onChanged: (value) {
                          setState(() {
                            isShowDeleted = value;
                          });
                        },
                      ),
                      12.widthBox,
                      Text(
                        "Rodyti ištrintus pranešimus",
                        style: CustomStyles.body2
                            .copyWith(color: CustomColors.white),
                      ),
                      const Spacer(),
                      UpdatedAdminViewTypeSwitch(
                        isMapView: isMapView,
                        onIsMapViewChange: (value) {
                          setState(() {
                            isMapView = value;
                          });
                        },
                      ),
                    ],
                  ),
                  12.heightBox,
                  if (isMapView)
                    _BuildMap(
                      height: height.toDouble(),
                      markers: isShowDumps ? dumpMarkers : reportMarkers,
                      initialTarget: isShowDumps
                          ? dumpMarkers.first.position
                          : reportMarkers.first.position,
                    )
                  else
                    AdminTable(
                      isShowDumps: isShowDumps,
                      reports: isShowDumps ? mockDumpModels : mockReportModels,
                    ),
                  // CustomButton(
                  //   text: 'Eiti i report',
                  //   onPressed: () {
                  //     context.goNamed('dump',
                  //         extra: mockReportModels.first,
                  //         pathParameters: {'id': mockReportModels.first.id});
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}

class _BuildMap extends StatelessWidget {
  const _BuildMap({
    required this.height,
    required this.markers,
    required this.initialTarget,
  });

  final double height;
  final Set<Marker> markers;
  final LatLng initialTarget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.toDouble(),
      child: GoogleMap(
        mapType: MapType.none,
        markers: markers,
        initialCameraPosition: CameraPosition(
          target: initialTarget,
          zoom: 13,
        ),
      ),
    );
  }
}
