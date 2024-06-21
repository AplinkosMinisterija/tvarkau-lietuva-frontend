import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({
    super.key,
    required this.width,
    required this.isBeetleCategory,
  });

  final double width;
  final bool isBeetleCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.0043),
      margin: EdgeInsets.only(
        top: width * 0.01,
      ),
      height: width * 0.0838,
      width: isBeetleCategory ? width * 0.75 : width * 0.68,
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
              isBeetleCategory
                  ? '1. Spustelėkite ant žemėlapio ir pele nutempkite smeigtuką į vietą, kurioje pastebėjote pažeistus medžius.'
                  : '1. Spustelėkite ant žemėlapio ir pele nutempkite smeigtuką į vietą, kurioje pastebėjote pažeidimą.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.0125, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.00833),
            Text(
              isBeetleCategory
                  ? '2. Nurodykite pažeistų medžių skaičių, jei reikia, aprašykite informaciją susijusią su aptiktu židiniu ir pridėkite nuotraukas.'
                  : '2. Aprašykite informaciją susijusią su pastebėtu pažeidimu, pridėkite nuotraukas.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.0125, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.00833),
            Text(
              isBeetleCategory
                  ? '3. Spauskite mygtuką “Pranešti” ir miškininkai pasirūpins jūsų pranešimu.'
                  : '3. Spauskite mygtuką „Pranešti“, o kilus klausimams su Jumis susisieks departamento pareigūnai.',
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
