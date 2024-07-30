import 'dart:math';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/home/ui/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../tile_provider.dart';

class HomeLayoutMobile extends StatefulWidget {
  const HomeLayoutMobile({
    required this.scrollOffset,
    required this.width,
    super.key,
  });

  final double scrollOffset;
  final double width;

  @override
  State<HomeLayoutMobile> createState() => _HomeLayoutMobileState();
}

class _HomeLayoutMobileState extends State<HomeLayoutMobile> {
  // late bool isMapHover;
  // late ScrollController scrollController;
  List<Marker> allMarkers = [];

  // Future<void> updateScrollControllerOffset(double offset) async {
  //   await SecureStorageProvider().setScrollOffset(offset);
  // }

  @override
  void initState() {
    // scrollController =
    //     ScrollController(initialScrollOffset: widget.scrollOffset);
    // isMapHover = false;
    super.initState();
    Future.microtask(() {
      final r = Random();
      for (var x = 0; x < 1000; x++) {
        allMarkers.add(
          Marker(
            point: LatLng(r.nextDouble() * 54, r.nextDouble() * 24),
            height: 12,
            width: 12,
            child: ColoredBox(color: Colors.blue[900]!),
          ),
        );
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //physics: isMapHover ? const NeverScrollableScrollPhysics() : null,
      //controller: scrollController,
      child: Stack(
        children: [
          BackgroundWidget(
            width: widget.width,
            isMobile: true,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: widget.width * 0.0445,
              right: widget.width * 0.0445,
              top: widget.width * 0.087,
              bottom: widget.width * 0.0361,
            ),
            child: Column(
              children: [
                LogoButton(
                    width: widget.width * 0.91,
                    onTap: () {
                      context.goNamed('home');
                    }),
                SizedBox(height: widget.width * 0.1472),
                TitleWidget(
                  width: widget.width,
                  isMobile: true,
                  onTap: () {
                    context.goNamed('report_category');
                  },
                ),
                // MapScreen(
                //   isMapHover: (isHover) {
                //     setState(() {
                //       isMapHover = isHover;
                //     });
                //   },
                //   width: widget.width,
                //   isMobile: true,
                // ),
                SizedBox(
                  height: widget.width * 1.722,
                  width: widget.width * 0.9112,
                  child: Stack(
                    children: [
                      FlutterMap(
                        options: MapOptions(
                          initialCameraFit: CameraFit.bounds(
                            bounds: LatLngBounds(
                              const LatLng(55, -9),
                              const LatLng(37, 30),
                            ),
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 88,
                              bottom: 192,
                            ),
                          ),
                        ),
                        children: [
                          openStreetMapTileLayer,
                          MarkerLayer(markers: allMarkers),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: widget.width * 0.0343),
                Footer(
                  width: widget.width,
                  isMobile: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
