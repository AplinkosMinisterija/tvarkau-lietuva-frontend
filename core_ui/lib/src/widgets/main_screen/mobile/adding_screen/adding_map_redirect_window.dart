import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddingMapRedirectWindow extends StatefulWidget {
  const AddingMapRedirectWindow({
    super.key,
    required this.width,
    //required this.marker,
    required this.onTap,
  });

  final double width;
  //final Set<Marker> marker;
  final VoidCallback onTap;

  @override
  State<AddingMapRedirectWindow> createState() =>
      _AddingMapRedirectWindowState();
}

class _AddingMapRedirectWindowState extends State<AddingMapRedirectWindow> {
  Set<Marker> marker = {};
  late CameraPosition viewPosition;
  late GoogleMapController _googleMapController;

  @override
  void initState() {
    marker.clear();
    super.initState();
  }

  void animate() {
    _googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(
          LatLng(
            viewPosition.target.latitude,
            viewPosition.target.longitude,
          ),
          viewPosition.zoom),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.marker.isNotEmpty) {
    //   marker.add(widget.marker.first);
    //   viewPosition = CameraPosition(
    //       target: LatLng(
    //         marker.first.position.latitude,
    //         marker.first.position.longitude,
    //       ),
    //       zoom: 9);
    //   animate();
    // } else {
    //   viewPosition =
    //       const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 6.2);
    //   if (marker.isNotEmpty) {
    //     animate();
    //   }
    //   marker.clear();
    // }
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
                    child: Container(color: Colors.white,)
                  ),
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
                    'Pažymėkite vietą, kur pastebėjote žievėgraužį',
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
