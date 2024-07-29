import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddingMapRedirectWindow extends StatefulWidget {
  const AddingMapRedirectWindow({
    super.key,
    required this.width,
    required this.onTap,
  });

  final double width;
  final VoidCallback onTap;

  @override
  State<AddingMapRedirectWindow> createState() =>
      _AddingMapRedirectWindowState();
}

class _AddingMapRedirectWindowState extends State<AddingMapRedirectWindow> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

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
                  // ClipRRect(
                  //   borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //   child: GoogleMap(
                  //     initialCameraPosition: viewPosition,
                  //     markers: marker.isNotEmpty ? marker : {},
                  //     onMapCreated: (GoogleMapController controller) {
                  //       _googleMapController = controller;
                  //       _googleMapController.animateCamera(
                  //         CameraUpdate.newLatLngZoom(
                  //             LatLng(viewPosition.target.latitude,
                  //                 viewPosition.target.longitude),
                  //             viewPosition.zoom),
                  //       );
                  //     },
                  //     webGestureHandling: WebGestureHandling.none,
                  //     mapToolbarEnabled: false,
                  //     scrollGesturesEnabled: false,
                  //     zoomControlsEnabled: false,
                  //     zoomGesturesEnabled: false,
                  //   ),
                  // ),
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
