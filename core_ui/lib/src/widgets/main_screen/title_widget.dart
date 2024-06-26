import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
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
        SizedBox(
          width: width * 0.4234,
          child: Text(
            'Tvarkau Lietuvą',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: width * 0.0580,
            ),
          ),
        ),
        SizedBox(
          height: width * 0.0104,
        ),
        SizedBox(
          width: width * 0.4166,
          child: Text(
            'Žemėlapyje pažymėkite gamtoje pastebėtus pažeidimus: nuo atliekomis užterštų vietovių iki kenkėjų apniktų eglių. Aplinkos apsaugos departamento pareigūnai išnagrinės pranešimus ir pasirūpins, kad pažeidėjai būtų surasti ir pašalintų padarytus pažeidimus ar atlygintų padarytą žalą gamtai.',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: width * 0.009,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
