import 'package:core/utils/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FooterConsultationInformation extends StatelessWidget {
  const FooterConsultationInformation({
    super.key,
    required this.width,
    required this.isMobile,
  });

  final double width;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? width * 0.911 : width * 0.5578,
      height: isMobile ? width * 0.4027 : width * 0.104,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(57, 97, 84, 0.07),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? width * 0.05 : width * 0.01875,
      ),
      child: SelectionArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Apie aplinkosaugą galite pasikonsultuoti darbo dienomis',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: isMobile ? width * 0.03889 : width * 0.01093,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(28, 63, 58, 1),
                ),
              ),
            ),
            SizedBox(height: isMobile ? width * 0.03889 : width * 0.0125),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  size: isMobile ? width * 0.0556 : width * 0.0156,
                  color: const Color.fromRGBO(28, 63, 58, 1),
                ),
                SizedBox(width: isMobile ? width * 0.03 : width * 0.0094),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch('tel:+37070002022');
                  },
                  child: Text(
                    '+370 700 02022',
                    style: GoogleFonts.roboto(
                      fontSize: isMobile ? width * 0.031 : width * 0.01093,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.0304),
                Icon(
                  Icons.email,
                  size: isMobile ? width * 0.0556 : width * 0.0156,
                  color: const Color.fromRGBO(28, 63, 58, 1),
                ),
                SizedBox(width: isMobile ? width * 0.03 : width * 0.0094),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch(
                        'mailto:konsultacijos@aad.am.lt?subject=Konsultacija');
                  },
                  child: Text(
                    'konsultacijos@aad.am.lt',
                    style: GoogleFonts.roboto(
                      fontSize: isMobile ? width * 0.031 : width * 0.01093,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile ? width * 0.0333 : width * 0.0125),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.campaign,
                  size: isMobile ? width * 0.0556 : width * 0.0156,
                  color: const Color.fromRGBO(255, 106, 61, 1),
                ),
                SizedBox(width: isMobile ? width * 0.03 : width * 0.0094),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch('tel:+112');
                  },
                  child: Text(
                    'Pastebėję galimą aplinkosauginį pažeidimą,\npraneškite tel. 112',
                    style: GoogleFonts.roboto(
                      fontSize: isMobile ? width * 0.031 : width * 0.01093,
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
