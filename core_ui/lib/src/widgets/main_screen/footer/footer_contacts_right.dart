import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

class FooterContactsRight extends StatelessWidget {
  const FooterContactsRight({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width * 0.0852,
      width: width * 0.114,
      child: SelectionArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.phone,
                  color: const Color.fromRGBO(28, 63, 58, 1),
                  size: width * 0.01563,
                ),
                SizedBox(width: width * 0.009375),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch('tel:+37052163385');
                  },
                  child: Text(
                    '+370 5 216 3385',
                    style: GoogleFonts.roboto(
                      fontSize: width * 0.01094,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                LaunchUrl()
                    .launch('mailto:info@aad.am.lt?subject=Konsultacija');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: const Color.fromRGBO(28, 63, 58, 1),
                    size: width * 0.01563,
                  ),
                  SizedBox(width: width * 0.009375),
                  Text(
                    'info@aad.am.lt',
                    style: GoogleFonts.roboto(
                      fontSize: width * 0.01094,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                LaunchUrl().launch(
                    'https://www.linkedin.com/company/aplinkos-apsaugos-departamentas/');
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/linkedin.svg',
                    width: width * 0.014,
                    height: width * 0.014,
                    colorFilter: const ui.ColorFilter.mode(
                      Color.fromRGBO(28, 63, 58, 1),
                      ui.BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: width * 0.009375),
                  Text(
                    'LinkedIn',
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
