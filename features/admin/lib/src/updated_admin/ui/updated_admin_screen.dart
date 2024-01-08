import 'package:admin/src/updated_admin/widgets/admin_table_deleted.dart';
import 'package:admin/src/updated_admin/widgets/admin_table_dumps.dart';
import 'package:api_client/api_client.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';
import '../widgets/admin_table_reports.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/custom_switch.dart';
import '../widgets/header.dart';
import '../widgets/updated_admin_view_type_switch.dart';
import '../widgets/updated_report_type_switch.dart';

class UpdatedAdminScreen extends StatefulWidget {
  const UpdatedAdminScreen({
    required this.name,
    required this.email,
    required this.reports,
    required this.dumps,
    required this.onLogout,
    Key? key,
  }) : super(key: key);

  final String name;
  final String email;
  final List<FullReportDto> reports;
  final List<FullDumpDto> dumps;
  final VoidCallback onLogout;

  @override
  State<UpdatedAdminScreen> createState() => _UpdatedAdminScreenState();
}

class _UpdatedAdminScreenState extends State<UpdatedAdminScreen> {
  bool isShowDumps = false;
  bool isMapView = false;
  bool isShowDeleted = false;
  Set<Marker> reportMarkers = {};
  Set<Marker> dumpMarkers = {};

  Future<void> setupMarker() async {
    final description = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50, 50)),
        'assets/svg/pin_icon.svg');

    for (final report in widget.reports) {
      reportMarkers.add(Marker(
        markerId: MarkerId(report.refId),
        position: LatLng(report.latitude, report.longitude),
        icon: description,
        onTap: () {
          String str = '0' * (8 - report.refId.length);
          context.goNamed('report_admin', queryParameters: {
            'id': 'TLP-A$str${report.refId.toUpperCase()}'
          });
        },
      ));
    }
    for (final dump in widget.dumps) {
      dumpMarkers.add(Marker(
        markerId: MarkerId(dump.refId),
        position: LatLng(dump.latitude, dump.longitude),
        icon: description,
        onTap: () {
          context.goNamed('dump_admin', queryParameters: {
            'id': dump.refId,
          });
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
                                setState(() {
                                  isShowDumps = value;
                                });
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
                      !isShowDeleted
                          ? UpdatedAdminViewTypeSwitch(
                              isMapView: isMapView,
                              onIsMapViewChange: (value) {
                                setState(() {
                                  isMapView = value;
                                });
                              },
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  12.heightBox,
                  !isShowDeleted
                      ? isMapView
                          ? _BuildMap(
                              height: height.toDouble(),
                              markers:
                                  isShowDumps ? dumpMarkers : reportMarkers,
                              initialTarget: isShowDumps
                                  ? dumpMarkers.first.position
                                  : reportMarkers.first.position,
                            )
                          : isShowDumps
                              ? AdminTableDumps(dumps: widget.dumps)
                              : AdminTableReports(reports: widget.reports)
                      : const AdminTableDeleted(),
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
