import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AddingInformationHeader extends StatelessWidget {
  const AddingInformationHeader(
      {super.key, required this.width, required this.isBeetleCategory});

  final double width;
  final bool isBeetleCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.815,
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
              '1. Spustelėkite „Pažymėkite vietą” ir suteikite prieigą prie jūsų vietos nustatymo.',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.03333, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.02),
            Text(
              '2. Jei vieta automatiškai nustatyta teisingai - spauskite „Išsaugoti pažymėtą vietą” arba prieš tai patikslinkite vietą nuvilkdami smeigtuką į reikiamą vietą.',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.03333, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.02),
            Text(
              '3. Jeigu nesuteikėte prieigos naudoti jūsų įrenginio vietos, nurodykite pažeidimo vietą nuvilkdami smeigtuką ant žemėlapio.',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.03333, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.02),
            Text(
              isBeetleCategory
                  ? '4. Jeigu pastebite žievėgraužio tipografo apniktas egles arba tikėtiną jo veisimosi vietą, pridėkite nuotraukas.'
                  : '4. Aprašykite informaciją susijusią su pastebėtu pažeidimu, pridėkite nuotraukas.',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.03333, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: width * 0.02),
            Text(
              '5. Spauskite mygtuką „Pranešti“, o kilus klausimams su Jumis susisieks departamento pareigūnai.',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                  fontSize: width * 0.03333, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
