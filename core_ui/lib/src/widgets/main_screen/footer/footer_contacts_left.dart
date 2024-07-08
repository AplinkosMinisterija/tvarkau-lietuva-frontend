import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterContactsLeft extends StatelessWidget {
  const FooterContactsLeft({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SizedBox(
        height: width * 0.0852,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                LaunchUrl().launch(
                    'https://www.google.com/maps/place/Aplinkos+apsaugos+departamentas+prie+Aplinkos+ministerijos/@54.6724038,25.2570797,17z/data=!3m1!4b1!4m6!3m5!1s0x46dd959a4506ece3:0x9d8c56cbb40726e0!8m2!3d54.6724007!4d25.2596546!16s%2Fg%2F11tsn4l6lh?entry=ttu');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: const Color.fromRGBO(28, 63, 58, 1),
                    size: width * 0.01563,
                  ),
                  SizedBox(width: width * 0.009375),
                  Text(
                    'Biudžetinė įstaiga,\nSmolensko g. 15, 03201\nVilnius',
                    style: GoogleFonts.roboto(
                      fontSize: width * 0.01094,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                LaunchUrl().launch(
                    'https://www.facebook.com/aplinkosapsaugosdepartamentas/');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.facebook,
                    size: width * 0.014,
                    color: const Color.fromRGBO(28, 63, 58, 1),
                  ),
                  SizedBox(width: width * 0.009375),
                  Text(
                    'Facebook',
                    style: GoogleFonts.roboto(
                      fontSize: width * 0.01094,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
