import 'package:core/utils/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FooterConsultationInformation extends StatelessWidget {
  const FooterConsultationInformation({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.5578,
      height: width * 0.104,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(57, 97, 84, 0.07),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.01875,
        vertical: width * 0.0164,
      ),
      child: SelectionArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Apie aplinkosaugą galite pasikonsultuoti darbo dienomis',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: width * 0.01093,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(28, 63, 58, 1),
                ),
              ),
            ),
            SizedBox(height: width * 0.0125),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  size: width * 0.0156,
                  color: const Color.fromRGBO(28, 63, 58, 1),
                ),
                SizedBox(width: width * 0.0094),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch('tel:+37070002022');
                  },
                  child: Text(
                    '+370 700 02022',
                    style: GoogleFonts.roboto(
                      fontSize: width * 0.01093,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.0304),
                Icon(
                  Icons.email,
                  size: width * 0.0156,
                  color: const Color.fromRGBO(28, 63, 58, 1),
                ),
                SizedBox(width: width * 0.0094),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch(
                        'mailto:konsultacijos@aad.am.lt?subject=Konsultacija');
                  },
                  child: Text(
                    'konsultacijos@aad.am.lt',
                    style: GoogleFonts.roboto(
                      fontSize: width * 0.01093,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: width * 0.0125),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.campaign,
                  size: width * 0.0156,
                  color: const Color.fromRGBO(255, 106, 61, 1),
                ),
                SizedBox(width: width * 0.0094),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch('tel:+112');
                  },
                  child: Text(
                    'Pastebėję galimą aplinkosauginį pažeidimą, praneškite tel. 112',
                    style: GoogleFonts.roboto(
                      fontSize: width * 0.01093,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
