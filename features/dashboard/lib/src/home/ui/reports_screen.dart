import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:api_client/api_client.dart';
import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({
    required this.reports,
    required this.dumpReports,
    required this.reportStatistics,
    required this.category,
    required this.onAddTap,
    required this.onInformationTap,
    required this.onCategoryChange,
    super.key,
  });

  final List<PublicReportDto> reports;
  final List<DumpDto>? dumpReports;
  final ReportStatisticsDto reportStatistics;
  final String category;
  final Function(double, double) onAddTap;
  final Function(String) onInformationTap;
  final Function(String) onCategoryChange;

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  late bool isMapHover;
  bool isShowDumps = false;
  bool isTrash = false;
  String? initialItem;

  static const List<String> _dropdownList = [
    'Atliekos',
    'Sugadinta miško paklotė ir keliai',
  ];

  @override
  void initState() {
    isMapHover = false;
    if (widget.category == 'trash') {
      initialItem = 'Atliekos';
      isTrash = true;
    } else if (widget.category == 'forest') {
      initialItem = 'Sugadinta miško paklotė ir keliai';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return constraints.maxWidth > 900
            ? SingleChildScrollView(
                physics:
                    isMapHover ? const NeverScrollableScrollPhysics() : null,
                child: Stack(
                  children: <Widget>[
                    BackgroundWidget(width: constraints.maxWidth),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.1875,
                        vertical: constraints.maxWidth * 0.0083,
                      ),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: DepartmentLogo(
                              width: constraints.maxWidth,
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.058,
                          ),
                          TitleWidget(width: constraints.maxWidth),
                          SizedBox(
                            height: constraints.maxWidth * 0.009,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: AddButton(
                              onTap: () {
                                widget.onAddTap(
                                  constraints.maxWidth,
                                  constraints.maxHeight,
                                );
                              },
                              width: constraints.maxWidth,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "Pranešimų skaičius: ${widget.reports.length}",
                                style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.009,
                          ),
                          Stack(
                            children: [
                              isShowDumps
                                  ? MainDumpMap(
                                      width: constraints.maxWidth,
                                      onReportTypeChange: (bool value) {
                                        setState(() {
                                          isShowDumps = value;
                                        });
                                      },
                                      isShowDumps: isShowDumps,
                                      dumpReports: widget.dumpReports ?? [],
                                      isHovering: (bool value) {
                                        setState(() {
                                          isMapHover = value;
                                        });
                                      },
                                    )
                                  : MainTrashMap(
                                      width: constraints.maxWidth,
                                      onReportTypeChange: (bool value) {
                                        setState(() {
                                          isShowDumps = value;
                                        });
                                      },
                                      isShowDumps: isShowDumps,
                                      isTrash: isTrash,
                                      trashReports: widget.reports,
                                      isHovering: (bool value) {
                                        setState(() {
                                          isMapHover = value;
                                        });
                                      },
                                      onInformationTap: (String refId) {
                                        widget.onInformationTap(refId);
                                      },
                                    ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 20),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: constraints.maxWidth * 0.3,
                                    child: PointerInterceptor(
                                      child: CustomDropdown<String>(
                                        hintText: 'Pasirinkite kategoriją',
                                        items: _dropdownList,
                                        initialItem: initialItem,
                                        onChanged: (value) {
                                          widget.onCategoryChange(value);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.0135,
                          ),
                          ReportStatistics(
                            reportStatistics: widget.reportStatistics,
                          ),
                          SizedBox(
                            height: constraints.maxWidth * 0.033,
                          ),
                          isShowDumps
                              ? const SizedBox.shrink()
                              : ReportTable(
                                  width: constraints.maxWidth,
                                  reports: widget.reports,
                                  onInformationTap: (refId) {
                                    widget.onInformationTap(refId);
                                  },
                                ),
                          const Divider(
                            height: 1,
                            color: Color.fromRGBO(10, 51, 40, 0.1),
                          ),
                          SizedBox(height: constraints.maxWidth * 0.0343),
                          Footer(
                            width: constraints.maxWidth,
                          ),
                          SizedBox(height: constraints.maxWidth * 0.0166),
                          const Divider(
                            height: 1,
                            color: Color.fromRGBO(10, 51, 40, 0.1),
                          ),
                          SizedBox(height: constraints.maxWidth * 0.0166),
                          Row(
                            children: <Widget>[
                              Copyright(
                                width: constraints.maxWidth,
                              ),
                              const Spacer(),
                              SupportTag(
                                width: constraints.maxWidth,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                physics:
                    isMapHover ? const NeverScrollableScrollPhysics() : null,
                child: Stack(
                  children: <Widget>[
                    BackgroundWidget(width: constraints.maxWidth * 3.5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.0444),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: constraints.maxWidth * 0.05),
                          Align(
                            alignment: Alignment.topLeft,
                            child: DepartmentLogoMobile(
                              width: constraints.maxWidth,
                              onTap: () {
                                LaunchUrl().launch('https://aad.lrv.lt/');
                              },
                            ),
                          ),
                          SizedBox(height: constraints.maxWidth * 0.0889),
                          TitleWidgetMobile(width: constraints.maxWidth),
                          SizedBox(height: constraints.maxWidth * 0.0689),
                          AddButtonMobile(
                            onTap: () {
                              widget.onAddTap(
                                constraints.maxWidth,
                                constraints.maxHeight,
                              );
                            },
                            width: constraints.maxWidth,
                          ),
                          SizedBox(height: constraints.maxWidth * 0.05),
                          SizedBox(
                            width: constraints.maxWidth,
                            child: CustomDropdown<String>(
                              hintText: 'Pasirinkite kategoriją',
                              items: _dropdownList,
                              initialItem: initialItem,
                              onChanged: (value) {
                                widget.onCategoryChange(value);
                              },
                            ),
                          ),
                          SizedBox(height: constraints.maxWidth * 0.01),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Pranešimų skaičius: ${widget.reports.length}",
                              style: GoogleFonts.roboto(
                                  fontSize: constraints.maxWidth * 0.0333,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(height: constraints.maxWidth * 0.01),
                          isShowDumps
                              ? MainDumpMapMobile(
                                  width: constraints.maxWidth,
                                  onReportTypeChange: (bool value) {
                                    setState(() {
                                      isShowDumps = value;
                                    });
                                  },
                                  isShowDumps: isShowDumps,
                                  dumpReports: widget.dumpReports ?? [],
                                  isHovering: (bool value) {
                                    setState(() {
                                      isMapHover = value;
                                    });
                                  },
                                )
                              : MainTrashMapMobile(
                                  width: constraints.maxWidth,
                                  onReportTypeChange: (bool value) {
                                    setState(() {
                                      isShowDumps = value;
                                    });
                                  },
                                  isShowDumps: isShowDumps,
                                  isTrash: isTrash,
                                  trashReports: widget.reports,
                                  isHovering: (bool value) {
                                    setState(() {
                                      isMapHover = value;
                                    });
                                  },
                                  onInformationTap: (refId) {
                                    widget.onInformationTap(
                                      refId,
                                    );
                                  },
                                ),
                          ReportStatistics(
                            reportStatistics: widget.reportStatistics,
                          ),
                          const Divider(
                            height: 1,
                            color: Color.fromRGBO(10, 51, 40, 0.1),
                          ),
                          SizedBox(height: constraints.maxWidth * 0.083),
                          FooterContactsMobile(width: constraints.maxWidth),
                          SizedBox(
                            height: constraints.maxWidth * 0.0666,
                          ),
                          FooterDescriptionMobile(width: constraints.maxWidth),
                          SizedBox(height: constraints.maxWidth * 0.044),
                          Padding(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.01388),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  LaunchUrl().launch(
                                      'https://aad.lrv.lt/lt/administracine-informacija/asmens-duomenu-apsauga/');
                                },
                                child: Text(
                                  'Departamento BDAR taisyklės',
                                  style: GoogleFonts.roboto(
                                    fontSize: constraints.maxWidth * 0.04,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxWidth * 0.044),
                          FooterConsultMobile(width: constraints.maxWidth),
                          SizedBox(height: constraints.maxWidth * 0.044),
                          FooterSupportMobile(width: constraints.maxWidth),
                          SizedBox(height: constraints.maxWidth * 0.041),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
