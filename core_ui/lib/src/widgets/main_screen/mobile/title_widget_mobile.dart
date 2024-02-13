import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidgetMobile extends StatelessWidget {
  const TitleWidgetMobile({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Tvarkau Lietuvą',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            fontSize: width * 0.1111,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: width * 0.033,
        ),
        Text(
          'Žemėlapyje pažymėkite gamtoje pastebėtus pažeidimus. Aplinkos apsaugos departamento pareigūnai išnagrinės pranešimus ir pasirūpins, kad pažeidėjai būtų surasti ir pašalintų padarytus pažeidimus ar atlygintų padarytą žalą gamtai.',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: width * 0.04444,
            height: width * 0.003222,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
