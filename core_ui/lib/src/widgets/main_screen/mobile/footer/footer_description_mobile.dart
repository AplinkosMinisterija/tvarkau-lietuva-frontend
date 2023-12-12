import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FooterDescriptionMobile extends StatelessWidget {
  const FooterDescriptionMobile({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'tvarkaulietuva.lt',
            textAlign: TextAlign.left,
            style: GoogleFonts.roboto(
              fontSize: width * 0.03888,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(57, 97, 84, 1),
            ),
          ),
          SizedBox(height: width * 0.022),
          SizedBox(
            width: width * 0.888,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Tai bandomoji sistemos versija, skirta viešinti visus\nAplinkos apsaugos departamentui žinomas ir potencialiai\nnelegalias atliekų susidarymo vietas. Sistemoje suteikiama\ngalimybė visuomenei pranešti apie dar neužfiksuotas vietas,\nbei sekti jų nagrinėjimo situaciją.',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontSize: width * 0.03333,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
