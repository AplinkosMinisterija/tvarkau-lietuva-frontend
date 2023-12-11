import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';
import '../widgets/admin_table.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/custom_switch.dart';
import '../widgets/header.dart';
import '../widgets/updated_admin_view_type_switch.dart';
import '../widgets/updated_report_type_switch.dart';

class UpdatedAdminScreen extends StatelessWidget {
  const UpdatedAdminScreen({
    Key? key,
  }) : super(key: key);
  final name = 'Vardas Pavardė';
  final email = 'vardas.pavarde@gmail.com';

  List<ReportModel> get mockReportModels => [
        ReportModel(
          id: "1",
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
        // ... Two more ReportModel instances
      ];

  @override
  Widget build(BuildContext context) {
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
                    isShowDumps: true,
                    onReportTypeChange: (value) {
                      //TODO: Add logic
                    },
                  ),
                  20.widthBox,
                  CustomSwitch(
                    value: true,
                    width: 64,
                    height: 32,
                    activeThumbColor: CustomColors.orange,
                    activeTrackColor: CustomColors.white,
                    inactiveTrackColor: CustomColors.white.withOpacity(.1),
                    inactiveThumbColor: CustomColors.primary.withOpacity(.4),
                    onChanged: (value) {
                      //TODO Add logic
                    },
                  ),
                  12.widthBox,
                  Text(
                    "Rodyti ištrintus pranešimus",
                    style:
                        CustomStyles.body2.copyWith(color: CustomColors.white),
                  ),
                  const Spacer(),
                  UpdatedAdminViewTypeSwitch(
                    isMapView: true,
                    onIsMapViewChange: (value) {
                      //TODO: Add logic
                    },
                  ),
                ],
              ),
              AdminTable(
                reports: mockReportModels,
                // onReportClick: (reportModel) {
                //   context.goNamed('dump',
                //       extra: reportModel,
                //       pathParameters: {'id': reportModel.id});
                // },
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
  }
}
