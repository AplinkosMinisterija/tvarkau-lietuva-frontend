import 'package:core_ui/core_ui.dart';
import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MainTrashMap extends StatefulWidget {
  const MainTrashMap({
    required this.width,
    required this.trashReports,
    required this.isHovering,
    required this.onReportTypeChange,
    required this.isShowDumps,
    required this.onInformationTap,
  });

  final double width;
  final List<ReportModel> trashReports;
  final ValueChanged<bool> isHovering;
  final ValueChanged<bool> onReportTypeChange;
  final bool isShowDumps;
  final Function(String) onInformationTap;

  @override
  State<MainTrashMap> createState() => _MainTrashMapState();
}

class _MainTrashMapState extends State<MainTrashMap> {
  final PopupController _popupController = PopupController();

  Set<Marker> trashMarkers = {};
  late List<Marker> _markers;

  List<Marker> getMarkers() {
    return widget.trashReports
        .map(
          (r) => Marker(
            key: ObjectKey(r),
            point: LatLng(r.reportLat, r.reportLong),
            width: 25,
            height: 30,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Image.asset(
                getTrashIconPath(r.status),
                key: Key('trash-icon-${r.status}'),
              ),
            ),
          ),
        )
        .toList();
  }

  final _initialCenter = const LatLng(55.1736, 23.8948);
  final _defaultZoom = 7.0;

  @override
  void initState() {
    _markers = getMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            SizedBox(
              height: widget.width * 0.4,
              width: widget.width * 0.625,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                child: Stack(
                  children: [
                    PopupScope(
                      popupController: _popupController,
                      child: FlutterMap(
                        options: MapOptions(
                          initialZoom: _defaultZoom,
                          initialCenter: _initialCenter,
                          minZoom: 6,
                          onTap: (_, __) => _popupController
                              .hideAllPopups(), // Hide popup when the map is tapped.
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            tileProvider: CancellableNetworkTileProvider(),
                          ),
                          RichAttributionWidget(
                            animationConfig: const ScaleRAWA(),
                            showFlutterMapAttribution: false,
                            alignment: AttributionAlignment.bottomLeft,
                            attributions: [
                              TextSourceAttribution(
                                'OpenStreetMap contributors',
                                onTap: () => launchUrl(
                                  Uri.parse(
                                    'https://openstreetmap.org/copyright',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MarkerClusterLayerWidget(
                            options: MarkerClusterLayerOptions(
                              maxClusterRadius: 60,
                              size: const Size(40, 40),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(50),
                              disableClusteringAtZoom: 12,
                              markers: _markers,
                              popupOptions: PopupOptions(
                                popupSnap: PopupSnap.markerTop,
                                popupController: _popupController,
                                popupBuilder: (_, marker) {
                                  final report = (marker.key as ObjectKey).value
                                      as ReportModel;

                                  return InfoTrashWindowBox(
                                    title: report.name ?? '',
                                    imageUrls: report.imageUrls ?? [],
                                    status: report.status,
                                    date: report.reportDate,
                                    reportId: report.refId ?? '',
                                    onTap: () {
                                      widget.onInformationTap(
                                        report.refId ?? '',
                                      );
                                    },
                                  );
                                },
                              ),
                              builder: (context, markers) {
                                return MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.teal,
                                    ),
                                    child: Center(
                                      child: Text(
                                        markers.length.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: ReportTypeSwitcher(
              width: widget.width,
              isShowDumps: widget.isShowDumps,
              onReportTypeChange: (bool value) {
                widget.onReportTypeChange(value);
              },
            ),
          ),
        ),
      ],
    );
  }

  String getTrashIconPath(String status) {
    if (status == "gautas") {
      return 'assets/icons/marker_pins/red_marker.png';
    } else if (status == "tiriamas") {
      return 'assets/icons/marker_pins/orange_marker.png';
    } else if (status == "ištirtas") {
      return 'assets/icons/marker_pins/blue_marker.png';
    } else if (status == "nepasitvirtino") {
      return 'assets/icons/marker_pins/gray_marker.png';
    } else if (status == "sutvarkyta") {
      return 'assets/icons/marker_pins/green_marker.png';
    } else {
      return 'assets/icons/marker_pins/red_marker.png';
    }
  }
}
