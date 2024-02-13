import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AddingInformationHeader extends StatelessWidget {
  const AddingInformationHeader({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.4,
      width: width * 0.911,
      padding: EdgeInsets.all(width * 0.028),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(57, 97, 84, 0.04),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color.fromRGBO(57, 97, 84, 0.12))),
      child: SizedBox(
        width: width * 0.8333,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1. Spustelėkite ant žemėlapio ir pažymėkite vietą,\n     kurioje aptikote šiukšles.',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.03333, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.02),
            Text(
              '2. Aprašykite informaciją, kuri susijusi su aptiktomis\n     šiukšlėmis, pridėkite nuotraukas.',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.03333, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.02),
            Text(
              '3. Spauskite mygtuką „Pranešti“, o kilus klausimams\n     su Jumis susisieks departamento pareigūnai.',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.03333, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
