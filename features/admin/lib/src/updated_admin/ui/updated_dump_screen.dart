import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/custom_styles.dart';
import '../common/extensions.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/base_dump_info.dart';
import '../widgets/custom_switch.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/dump_tabs.dart';
import '../widgets/header.dart';
import '../common/custom_colors.dart';

class UpdatedDumpScreen extends StatelessWidget {
  const UpdatedDumpScreen({
    // required this.dump,
    Key? key,
  }) : super(key: key);
  List<ReportModel> get mockReportModels => [
        ReportModel(
          id: "#TL20230001",
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
          status: "Aptarnaujama",
          phone: "+37061234567",
          comment: "Komentaras apie įvykį",
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
  final name = 'Vardas Pavardė';
  final email = 'vardas.pavarde@gmail.com';

  @override
  Widget build(BuildContext context) {
    final ReportModel dump = mockReportModels.first;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BaseAdminScreen(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 1200,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Header(
                      email: email,
                      name: name,
                      onLogout: () {
                        //TODO: Add logout logic
                      },
                    ),
                    42.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextButton(
                        onPressed: () {
                          context.pop();
                        },
                        text: 'Grįžti atgal',
                        icon: Icons.arrow_back,
                      ),
                    ),
                    17.heightBox,
                    Row(
                      children: [
                        Text(dump.id, style: CustomStyles.h2),
                        16.widthBox,
                        CustomSwitch(
                          value: dump.isVisible ?? false,
                          onChanged: (value) {
                            //TODO Add logic
                          },
                        ),
                        8.widthBox,
                        Text(
                          'Pranešimas ${(dump.isVisible ?? false) ? '' : 'ne'}rodomas',
                          style: CustomStyles.body2.copyWith(
                            color: CustomColors.white,
                          ),
                        ),
                      ],
                    ),
                    48.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: BaseDumpInfo(
                            dump: dump,
                          ),
                        ),
                        40.widthBox,
                        const DumpTabs(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
