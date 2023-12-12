import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_switch.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/header.dart';

class UpdatedDumpScreen extends StatefulWidget {
  const UpdatedDumpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatedDumpScreen> createState() => _UpdatedDumpScreenState();
}

class _UpdatedDumpScreenState extends State<UpdatedDumpScreen> {
  List<ReportModel> get mockReportModels => [
        ReportModel(
          id: "#TL20230001",
          name: "Pramonės aikštelė",
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
          const minHeight = 300;
          final height = constraints.maxHeight * .6 > minHeight
              ? constraints.maxHeight * .6
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
                        Text(dump.name, style: CustomStyles.h2),
                        16.widthBox,
                        CustomSwitch(
                          value: dump.isVisible ?? false,
                          onChanged: (value) {
                            //TODO Add logic
                          },
                        ),
                        8.widthBox,
                        Text(
                          '${(dump.isVisible ?? false) ? '' : 'Ne'}${(dump.isVisible ?? false) ? "R" : "r"}odomas žemėlapyje',
                          style: CustomStyles.body2.copyWith(
                            color: CustomColors.white,
                          ),
                        ),
                      ],
                    ),
                    48.heightBox,
                    Builder(builder: (context) {
                      final width = MediaQuery.of(context).size.width;
                      if (width < 1000) {
                        return _BuildMobileLayout(
                          dump: dump,
                          markers: markers,
                          height: height.toDouble(),
                        );
                      } else {
                        return _BuildDesktopLayout(
                          dump: dump,
                          markers: markers,
                          height: height.toDouble(),
                        );
                      }
                    })
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

class _BuildMobileLayout extends StatelessWidget {
  const _BuildMobileLayout(
      {required this.dump, required this.markers, required this.height});

  final ReportModel dump;
  final Set<Marker> markers;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BuildMap(
              height: height.toDouble(),
              markers: markers,
              initialTarget: LatLng(
                dump.reportLat,
                dump.reportLong,
              ),
            ),
            32.heightBox,
          ],
        ),
        24.heightBox,
        const _BuildForm(
          isMobile: true,
        ),
        24.heightBox,
      ],
    );
  }
}

class _BuildDesktopLayout extends StatelessWidget {
  const _BuildDesktopLayout({
    required this.dump,
    required this.markers,
    required this.height,
  });

  final ReportModel dump;
  final Set<Marker> markers;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _BuildMap(
            height: height.toDouble(),
            markers: markers,
            initialTarget: LatLng(
              dump.reportLat,
              dump.reportLong,
            ),
          ),
        ),
        40.widthBox,
        const _BuildForm(
          isMobile: false,
        ),
      ],
    );
  }
}

class _BuildForm extends StatelessWidget {
  const _BuildForm({
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: CustomColors.grey,
      ),
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 480),
      child: Column(
        children: [
          const _BuildInput(label: 'Aikštelės pavadinimas'),
          16.heightBox,
          Row(
            children: [
              const Expanded(child: _BuildInput(label: 'Ilguma')),
              16.widthBox,
              const Expanded(child: _BuildInput(label: 'Platuma')),
            ],
          ),
          16.heightBox,
          const _BuildInput(label: 'Aikštelės informacija'),
          16.heightBox,
          const _BuildInput(label: 'Telefono numeris'),
          16.heightBox,
          const _BuildInput(
            label: 'Darbo valandos',
            maxLines: 5,
          ),
          40.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                text: 'Atšaukti',
                buttonType: ButtonType.outlined,
                onPressed: () {},
              ),
              16.widthBox,
              CustomButton(
                text: 'Išsaugoti',
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BuildInput extends StatelessWidget {
  const _BuildInput({
    required this.label,
    this.maxLines = 1,
  });

  final String label;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomStyles.body2,
        ),
        4.heightBox,
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: TextField(
            decoration: InputDecoration(
                hoverColor: CustomColors.primary.withOpacity(0.05),
                fillColor: CustomColors.white,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: maxLines > 1 ? 16 : 0,
                )),
            style: CustomStyles.body2,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}
