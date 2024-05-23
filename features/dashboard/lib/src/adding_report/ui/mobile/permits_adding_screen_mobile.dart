import 'dart:collection';
import 'dart:convert';
import 'package:api_client/api_client.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:core_ui/core_ui.dart';
import 'dart:typed_data';
import '../permit.dart';
import 'package:http/http.dart' as http;

class PermitsAddingScreenMobile extends StatefulWidget {
  const PermitsAddingScreenMobile({
    required this.width,
    required this.height,
    required this.reports,
    required this.onAddTap,
    super.key,
  });

  final double width;
  final double height;
  final List<PublicReportDto> reports;
  final Function(String, String, double, double, List<Uint8List>) onAddTap;

  @override
  State<PermitsAddingScreenMobile> createState() =>
      _PermitsAddingScreenMobileState();
}

class _PermitsAddingScreenMobileState extends State<PermitsAddingScreenMobile> {
  late GoogleMapController mapController;
  bool _isPermitLayer = false;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
  }

  final CameraPosition _lithuaniaCameraPosition =
      const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0);

  Set<Polygon> _polygons = HashSet<Polygon>();
  final CustomInfoWindowController _customTrashInfoWindowController =
      CustomInfoWindowController();

  Future<Permit> fetchAlbum() async {
    final response = await http.get(
        Uri.parse('https://cdn.startupgov.lt/tiles/poc/lkmp/lkmp.geojson'));
    return Permit.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<void> voidAddPolygons(Permit permit) async {
    Set<Polygon> tempPolygons = {};

    for (var i = 0; i < permit.features!.length; i++) {
      List<LatLng> coords = [];
      for (var j = 0;
          j < permit.features![i].geometry!.coordinates![0][0].length;
          j++) {
        coords.add(LatLng(
            permit.features![i].geometry!.coordinates![0][0][j][1],
            permit.features![i].geometry!.coordinates![0][0][j][0]));
      }
      tempPolygons.add(
        Polygon(
          polygonId: PolygonId("P-$i"),
          points: coords,
          fillColor: Colors.red,
          strokeWidth: 1,
          onTap: () {
            _customTrashInfoWindowController.addInfoWindow!(
                InfoPermitWindowBox(
                  type: permit.features![i].properties!.tipas ?? '',
                  issuedFrom: permit.features![i].properties!.galiojaNuo ?? '',
                  issuedTo: permit.features![i].properties!.galiojaIki ?? '',
                  cadastralNumber:
                      permit.features![i].properties!.kadastrinisNr ?? '',
                  subdivision:
                      permit.features![i].properties!.vmuPadalinys ?? '',
                  forestryDistrict:
                      permit.features![i].properties!.girininkija ?? '',
                  block: permit.features![i].properties!.kvartalas.toString() ??
                      '',
                  plot: permit.features![i].properties!.sklypas ?? '',
                  cuttableArea: permit.features![i].properties!.kertamasPlotas
                          .toString() ??
                      '',
                  dominantTree:
                      permit.features![i].properties!.vyraujantysMedziai ?? '',
                  cuttingType:
                      permit.features![i].properties!.kirtimoRusis ?? '',
                  reinstatementType:
                      permit.features![i].properties!.atkurimoBudas ?? '',
                ),
                LatLng(permit.features![i].geometry!.coordinates![0][0][0][1],
                    permit.features![i].geometry!.coordinates![0][0][0][0]));
          },
        ),
      );
    }

    setState(() {
      _polygons = tempPolygons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    width: widget.width,
                    height: widget.width * 0.133,
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: widget.width * 0.05),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: widget.width * 0.0278),
                        SizedBox(
                          width: widget.width * 0.561,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              'Pasirinkite vietą žemėlapyje',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isPermitLayer = !_isPermitLayer;
                            });
                          },
                          icon: const Icon(
                            Icons.map,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await voidAddPolygons(snapshot.data!);
                          },
                          icon: const Icon(
                            Icons.data_array_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _isPermitLayer
                        ? Stack(
                            children: [
                              GoogleMap(
                                polygons: _polygons,
                                webGestureHandling:
                                    WebGestureHandling.cooperative,
                                buildingsEnabled: true,
                                initialCameraPosition: _lithuaniaCameraPosition,
                                onMapCreated:
                                    (GoogleMapController controller) async {
                                  _customTrashInfoWindowController
                                      .googleMapController = controller;
                                  mapController = controller;
                                },
                                onCameraMove: (position) {
                                  _customTrashInfoWindowController
                                      .onCameraMove!();
                                },
                                onTap: (position) {
                                  _customTrashInfoWindowController
                                      .hideInfoWindow!();
                                },
                              ),
                              CustomInfoWindow(
                                (top, left, width, height) => {},
                                leftMargin: 200,
                                controller: _customTrashInfoWindowController,
                                isDump: false,
                              ),
                            ],
                          )
                        : const GoogleMap(
                            buildingsEnabled: true,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(54.222, 22.222),
                              zoom: 7,
                            ),
                          ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
