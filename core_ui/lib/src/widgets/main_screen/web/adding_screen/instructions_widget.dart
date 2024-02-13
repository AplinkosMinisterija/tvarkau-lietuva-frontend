import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.0043),
      margin: EdgeInsets.only(
        top: width * 0.0167,
      ),
      height: width * 0.0838,
      width: width * 0.6,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 253, 251, 1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromRGBO(57, 97, 84, 0.12))),
      child: SizedBox(
        width: width * 0.8333,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1. Spustelėkite ant žemėlapio ir pažymėkite vietą, kurioje aptikote šiukšles.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.0125, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.00833),
            Text(
              '2. Aprašykite informaciją, kuri susijusi su aptiktomis šiukšlėmis, pridėkite nuotraukas.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.0125, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.00833),
            Text(
              '3. Spauskite mygtuką „Pranešti“, o kilus klausimams su Jumis susisieks departamento pareigūnai.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.0125, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
