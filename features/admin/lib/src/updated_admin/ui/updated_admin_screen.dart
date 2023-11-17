import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/custom_button.dart';

class UpdatedAdminScreen extends StatelessWidget {
  const UpdatedAdminScreen({
    Key? key,
  }) : super(key: key);

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
          status: "Aptarnaujama",
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
        child: Column(
          children: [
            const SizedBox(
              height: 500,
            ),
            CustomButton(
              text: 'Eiti i report',
              onPressed: () {
                context.goNamed('dump',
                    extra: mockReportModels.first,
                    pathParameters: {'id': mockReportModels.first.id});
              },
            ),
          ],
        ),
      ),
    ));
  }
}
