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
      height: width * 0.2416,
      width: width * 0.3711,
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
                  color: const Color.fromRGBO(57, 97, 84, 1),
                  size: width * 0.05,
                ),
                SizedBox(width: width * 0.023),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch('tel:+37052163385');
                  },
                  child: Text(
                    '+370 5 216 3385',
                    style: GoogleFonts.roboto(
                        fontSize: width * 0.03333, fontWeight: FontWeight.w400),
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
                  SizedBox(width: width * 0.008),
                  Icon(
                    Icons.email,
                    size: width * 0.05,
                    color: const Color.fromRGBO(57, 97, 84, 1),
                  ),
                  SizedBox(width: width * 0.043),
                  Text(
                    'info@aad.am.lt',
                    style: GoogleFonts.roboto(
                        fontSize: width * 0.03333, fontWeight: FontWeight.w400),
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
                  SizedBox(width: width * 0.008),
                  SvgPicture.asset(
                    'assets/svg/linkedin.svg',
                    height: width * 0.05,
                    width: width * 0.05,
                    colorFilter: const ui.ColorFilter.mode(
                      Color.fromRGBO(57, 97, 84, 1),
                      ui.BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: width * 0.043),
                  Text(
                    'LinkedIn',
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
