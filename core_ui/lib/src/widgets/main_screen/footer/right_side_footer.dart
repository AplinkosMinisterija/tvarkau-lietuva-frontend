import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RightSideFooter extends StatelessWidget {
  const RightSideFooter({
    super.key,
    required this.width,
    required this.onDataSecurityTap,
  });

  final double width;
  final VoidCallback onDataSecurityTap;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: width * 0.0817,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'tvarkaulietuva.lt',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2a6354),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: width * 0.005,
            ),
            SizedBox(
              width: width * 0.2333,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Tai bandomoji sistemos versija, skirta viešinti visus Aplinkos apsaugos \ndepartamentui žinomas ir potencialiai nelegalias atliekų susidarymo vietas. \nSistemoje suteikiama galimybė visuomenei pranešti apie dar neužfiksuotas vietas, \nbei sekti jų nagrinėjimo situaciją.',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: width * 0.005,
            ),
            InkWell(
              onTap: onDataSecurityTap,
              child: Text(
                'BDAR duomenų apsaugos informacija',
                style: GoogleFonts.roboto(
                  fontSize: width * 0.009,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: width * 0.005,
            ),
            Text(
              'Apie aplinkosaugą galite pasikonsultuoti darbo dienomis',
              maxLines: 2,
              style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: width * 0.005,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/phone_icon.svg',
                  height: width * 0.015,
                  width: width * 0.015,
                ),
                Text(
                  '8 700 02022',
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SvgPicture.asset(
                  'assets/svg/email_icon.svg',
                  height: width * 0.018,
                  width: width * 0.018,
                ),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch(
                        'mailto:konsultacijos@aad.am.lt?subject=Konsultacija');
                  },
                  child: Text(
                    'konsultacijos@aad.am.lt',
                    style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/exclamation_icon.svg',
                  height: width * 0.015,
                  width: width * 0.015,
                ),
                Text(
                  'Pastebėję galimą aplinkosauginį\npažeidimą, praneškite tel. 112',
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
