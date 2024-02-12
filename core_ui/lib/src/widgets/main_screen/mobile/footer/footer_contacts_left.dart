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
        height: width * 0.2416,
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
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: const Color.fromRGBO(57, 97, 84, 1),
                    size: width * 0.06,
                  ),
                  SizedBox(width: width * 0.033),
                  Text(
                    'Biudžetinė įstaiga,\nSmolensko g. 15, 03201\nVilnius',
                    style: GoogleFonts.roboto(
                        fontSize: width * 0.03333, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: width * 0.0316,
            ),
            GestureDetector(
              onTap: () {
                LaunchUrl().launch(
                    'https://www.facebook.com/aplinkosapsaugosdepartamentas/');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: width * 0.008),
                  Icon(
                    Icons.facebook,
                    size: width * 0.06,
                    color: const Color.fromRGBO(57, 97, 84, 1),
                  ),
                  SizedBox(width: width * 0.033),
                  Text(
                    'Facebook',
                    style: GoogleFonts.roboto(
                        fontSize: width * 0.03333, fontWeight: FontWeight.w400),
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
