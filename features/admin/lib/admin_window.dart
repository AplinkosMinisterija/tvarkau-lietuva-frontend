import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'src/common/custom_colors.dart';
import 'src/common/custom_styles.dart';
import 'src/widgets/admin_table_dumps.dart';
import 'src/widgets/admin_table_reports.dart';
import 'src/widgets/base_admin_screen.dart';
import 'src/widgets/custom_switch.dart';
import 'src/widgets/header.dart';
import 'src/widgets/updated_admin_view_type_switch.dart';
import 'src/widgets/updated_report_type_switch.dart';

class AdminWindow extends StatefulWidget {
  const AdminWindow({
    required this.name,
    required this.email,
    required this.reports,
    required this.dumps,
    required this.onLogout,
    required this.isShowDeleted,
    required this.onDeletedChange,
    required this.onTypeChange,
    required this.isShowDumps,
    Key? key,
  }) : super(key: key);

  final String name;
  final String email;
  final bool isShowDeleted;
  final bool isShowDumps;
  final List<FullReportDto>? reports;
  final List<FullDumpDto>? dumps;
  final VoidCallback onLogout;
  final VoidCallback onTypeChange;
  final VoidCallback onDeletedChange;

  @override
  State<AdminWindow> createState() => _AdminWindowState();
}

class _AdminWindowState extends State<AdminWindow> {
  bool isShowDumps = false;
  bool isMapView = false;
  bool isShowDeleted = false;

  @override
  void initState() {
    super.initState();
    isShowDumps = widget.isShowDumps;
    isShowDeleted = widget.isShowDeleted;
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
                    email: widget.email,
                    name: widget.name,
                    onLogout: () {
                      widget.onLogout();
                    },
                  ),
                  48.heightBox,
                  Text("Administracinė konsolė", style: CustomStyles.h2),
                  40.heightBox,
                  Row(
                    children: [
                      !isShowDeleted
                          ? UpdatedReportTypeSwitch(
                              isShowDumps: isShowDumps,
                              onReportTypeChange: (value) {
                                widget.onTypeChange();
                              },
                            )
                          : Opacity(
                              opacity: 0.3,
                              child: UpdatedReportTypeSwitch(
                                isShowDumps: isShowDumps,
                                onReportTypeChange: (value) {},
                              ),
                            ),
                      20.widthBox,
                      if (!isShowDumps) ...[
                        CustomSwitch(
                          value: isShowDeleted,
                          width: 64,
                          height: 32,
                          activeThumbColor: CustomColors.orange,
                          activeTrackColor: CustomColors.white,
                          inactiveTrackColor:
                              CustomColors.white.withOpacity(.1),
                          inactiveThumbColor:
                              CustomColors.primary.withOpacity(.4),
                          onChanged: (value) {
                            widget.onDeletedChange();
                          },
                        ),
                        12.widthBox,
                        Text(
                          "Rodyti ištrintus pranešimus",
                          style: CustomStyles.body2
                              .copyWith(color: CustomColors.white),
                        ),
                      ],
                      const Spacer(),
                      if (!isShowDeleted)
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
                  !isShowDeleted
                      ? isMapView
                          ? _DumpsAndReportsMap(
                              height: height.toDouble(),
                              dumps: widget.dumps,
                              reports: widget.reports,
                              isDumpsMode: isShowDumps,
                            )
                          : SizedBox(
                              height: height.toDouble(),
                              child: isShowDumps && widget.dumps != null
                                  ? AdminTableDumps(dumps: widget.dumps!)
                                  : AdminTableReports(reports: widget.reports!),
                            )
                      : SizedBox(
                          height: height.toDouble(),
                          child: AdminTableReports(
                            reports: widget.reports!,
                          )),
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}

class _DumpsAndReportsMap extends StatelessWidget {
  const _DumpsAndReportsMap({
    required this.height,
    required this.dumps,
    required this.reports,
    required this.isDumpsMode,
  });

  final double height;
  final bool isDumpsMode;
  final List<FullDumpDto>? dumps;
  final List<FullReportDto>? reports;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.toDouble(),
      child: AppMap(
        initialZoom: 2,
        layers: [
          if (isDumpsMode && dumps != null)
            FullDumpsLayer(
              dumps: dumps!,
              onTap: (dump) {
                context.goNamed('dump_admin', queryParameters: {
                  'id': dump.refId,
                });
              },
            ),
          if (!isDumpsMode && reports != null)
            FullReportsLayer(
              reports: reports!,
              onTap: (report) {
                String str = '0' * (8 - report.refId.length);
                context.goNamed('report_admin', queryParameters: {
                  'id': 'TLP-A$str${report.refId.toUpperCase()}'
                });
              },
            )
        ],
      ),
    );
  }
}
