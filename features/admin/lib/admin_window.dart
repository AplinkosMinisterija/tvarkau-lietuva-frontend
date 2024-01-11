import 'package:admin/src/widgets/admin_table_deleted.dart';
import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  Set<Marker> reportMarkers = {};
  Set<Marker> dumpMarkers = {};
  BitmapDescriptor? blueIcon;
  BitmapDescriptor? redIcon;
  BitmapDescriptor? grayIcon;
  BitmapDescriptor? greenIcon;
  BitmapDescriptor? orangeIcon;
  BitmapDescriptor? dumpIcon;

  Future<void> setupMarker() async {
    await setupIcons(widget.isShowDumps);
    if (isShowDumps) {
      dumpMarkers = widget.dumps!
          .map((element) => Marker(
                markerId: MarkerId(element.refId),
                position: LatLng(element.latitude, element.longitude),
                icon: getMarkerIcon(widget.isShowDumps, ''),
                onTap: () {
                  context.goNamed('dump_admin', queryParameters: {
                    'id': element.refId,
                  });
                },
              ))
          .toSet();
    } else {
      reportMarkers = widget.reports!
          .map((element) => Marker(
                markerId: MarkerId(element.refId),
                position: LatLng(element.latitude, element.longitude),
                icon: getMarkerIcon(widget.isShowDumps, element.status),
                onTap: () {
                  String str = '0' * (8 - element.refId.length);
                  context.goNamed('report_admin', queryParameters: {
                    'id': 'TLP-A$str${element.refId.toUpperCase()}'
                  });
                },
              ))
          .toSet();
    }
  }

  Future<void> setupIcons(bool isDump) async {
    if (isDump) {
      final icon = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(25, 40)),
          'assets/svg/pin_icon.svg');
      dumpIcon = icon;
    } else {
      final redMarker = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(25, 40)),
          'assets/icons/marker_pins/red_marker.png');
      final blueMarker = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(25, 40)),
          'assets/icons/marker_pins/blue_marker.png');
      final grayMarker = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(25, 40)),
          'assets/icons/marker_pins/gray_marker.png');
      final greenMarker = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(25, 40)),
          'assets/icons/marker_pins/green_marker.png');
      final orangeMarker = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(25, 40)),
          'assets/icons/marker_pins/orange_marker.png');
      redIcon = redMarker;
      blueIcon = blueMarker;
      grayIcon = grayMarker;
      greenIcon = greenMarker;
      orangeIcon = orangeMarker;
    }
  }

  BitmapDescriptor getMarkerIcon(bool isDump, String status) {
    if (isDump) {
      return dumpIcon!;
    } else {
      return switch (status) {
        'gautas' => redIcon!,
        'tiriamas' => orangeIcon!,
        'sutvarkyta' => greenIcon!,
        'ištirtas' => blueIcon!,
        'nepasitvirtino' => grayIcon!,
        _ => dumpIcon!,
      };
    }
  }

  @override
  void initState() {
    super.initState();
    isShowDumps = widget.isShowDumps;
    isShowDeleted = widget.isShowDeleted;
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
                          ? _BuildMap(
                              height: height.toDouble(),
                              markers:
                                  isShowDumps ? dumpMarkers : reportMarkers,
                              initialTarget: isShowDumps
                                  ? dumpMarkers.first.position
                                  : reportMarkers.first.position,
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
