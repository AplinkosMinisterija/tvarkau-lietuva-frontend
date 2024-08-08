import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

class AddingMapRedirectWindow extends StatefulWidget {
  const AddingMapRedirectWindow({
    super.key,
    required this.width,
    this.marker,
    required this.onTap,
    this.lat,
    this.long,
  });

  final double width;

  final Marker? marker;
  final double? lat;
  final double? long;
  final VoidCallback onTap;

  @override
  State<AddingMapRedirectWindow> createState() =>
      _AddingMapRedirectWindowState();
}

class _AddingMapRedirectWindowState extends State<AddingMapRedirectWindow> {

  late Marker marker;
  MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    if (widget.marker != null) {
      marker = widget.marker!;
      mapController.move(LatLng(marker.point.latitude, marker.point.longitude), 15);
      setState(() {});
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AbsorbPointer(
            child: SizedBox(
              height: widget.width * 0.444,
              width: widget.width * 0.911,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                          initialCenter: LatLng(
                              widget.marker?.point.latitude ?? 55,
                              widget.marker?.point.longitude ?? 24),
                          initialZoom: widget.marker == null ? 6 : 13,
                        ),
                        children: [
                          openStreetMapTileLayerRed,
                          if (widget.marker != null) ...[
                            MarkerLayer(markers: [marker])
                          ]
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: widget.width * 0.0278),
            child: Container(
              height: widget.width * 0.111,
              width: widget.width * 0.866,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_location_sharp,
                    size: widget.width * 0.0566,
                    color: const Color.fromRGBO(255, 106, 61, 1),
                  ),
                  SizedBox(width: widget.width * 0.0277),
                  Text(
                    'Pažymėkite vietą, kur pastebėjote pažeidimą',
                    style: GoogleFonts.roboto(
                        fontSize: widget.width * 0.028888,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayerRed => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'tvarkaulietuva.dev',
      tileProvider: CancellableNetworkTileProvider(),
    );
