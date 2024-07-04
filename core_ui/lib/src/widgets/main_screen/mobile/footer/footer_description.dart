import 'package:core/utils/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FooterDescription extends StatelessWidget {
  const FooterDescription({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.3133,
            height: width * 0.0797,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'tvarkaulietuva.lt',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontSize: width * 0.01093,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(28, 63, 58, 1),
                  ),
                ),
                SizedBox(height: width * 0.00468),
                Text(
                  'Tai bandomoji sistemos versija, skirta viešinti visus Aplinkos apsaugos departamentui žinomas ir potencialiai nelegalias atliekų susidarymo vietas. Sistemoje suteikiama galimybė visuomenei pranešti apie dar neužfiksuotas vietas, bei sekti jų nagrinėjimo situaciją.',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontSize: width * 0.009375,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.2335,
            height: width * 0.04844,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'smalsuolis.lt',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    fontSize: width * 0.01093,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(28, 63, 58, 1),
                  ),
                ),
                SizedBox(height: width * 0.00468),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Domina kas vyksta tave dominančioje teritorijoje realiu laiku? tapk ',
                        style: GoogleFonts.roboto(
                          fontSize: width * 0.009375,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'smalsuolis.lt',
                        style: GoogleFonts.roboto(
                          fontSize: width * 0.009375,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(28, 63, 58, 1),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            LaunchUrl().launch('https://smalsuolis.lt/');
                          },
                      ),
                      TextSpan(
                        text: ' nariu.',
                        style: GoogleFonts.roboto(
                          fontSize: width * 0.009375,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
