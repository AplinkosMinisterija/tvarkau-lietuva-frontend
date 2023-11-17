import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/base_dump_info.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_switch.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/dump_tabs.dart';
import '../widgets/header.dart';

class UpdatedDumpScreen extends StatefulWidget {
  const UpdatedDumpScreen({
    // required this.dump,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatedDumpScreen> createState() => _UpdatedDumpScreenState();
}

class _UpdatedDumpScreenState extends State<UpdatedDumpScreen> {
  //* Debuginant nepareina extra(mock model) per router ant hot reload
  List<ReportModel> get mockReportModels => [
        ReportModel(
          id: "#TL20230001",
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
          status: "Aptarnaujama",
          phone: "+37061234567",
          comment:
              "Šiandien, apsilankius miške, pastebėjau išmestus šiferio lakštus. Jų gana nemažas kiekis, maždaug apie 100 lakštų. Jie išmėtyti po gana didelę teritoriją. Kartu su šiferio lakštais yra išmesti ir seni baldai bei buitinė technika.",
          workingHours: "I-V 8:00-17:00",
          moreInformation: "Papildoma informacija",
          imageUrls: [
            "https://picsum.photos/200/300",
            "https://picsum.photos/200/300"
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
  Set<Marker> markers = {};
  Future<void> setupMarker() async {
    final dump = mockReportModels.first;
    final marker = Marker(
        markerId: MarkerId(dump.id),
        position: LatLng(
          dump.reportLat,
          dump.reportLong,
        ),
        icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(50, 50)),
            'assets/svg/pin_icon.svg'));
    setState(() {
      markers.add(marker);
    });
  }

  @override
  void initState() {
    setupMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ReportModel dump = mockReportModels.first;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          const minHeight = 250;
          final height = constraints.maxHeight * .25 > minHeight
              ? constraints.maxHeight * .25
              : minHeight;
          return BaseAdminScreen(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 1300,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BaseDumpInfo(
                                dump: dump,
                              ),
                              16.heightBox,
                              _BuildMap(
                                height: height.toDouble(),
                                markers: markers,
                                initialTarget: LatLng(
                                  dump.reportLat,
                                  dump.reportLong,
                                ),
                              ),
                              32.heightBox,
                              if (dump.comment != null)
                                Text(
                                  dump.comment!,
                                  style: CustomStyles.body1,
                                ),
                              if (dump.imageUrls != null &&
                                  dump.imageUrls!.isNotEmpty) ...[
                                15.heightBox,
                                _BuildImages(
                                  imageUrls: dump.imageUrls!,
                                )
                              ],
                              24.heightBox,
                              CustomButton(
                                  text: 'Trinti pranešimą',
                                  buttonType: ButtonType.outlined,
                                  color: CustomColors.red,
                                  onPressed: () {
                                    //TODO Add logic
                                  }),
                            ],
                          ),
                        ),
                        40.widthBox,
                        DumpTabs(
                          dump: dump,
                        ),
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

class _BuildImages extends StatelessWidget {
  const _BuildImages({
    required this.imageUrls,
  });

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.start,
      children: [
        ...imageUrls.map((e) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                e,
                fit: BoxFit.cover,
              ),
            ),
          );
        })
      ],
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
