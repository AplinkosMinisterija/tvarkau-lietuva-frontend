import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.width,
    required this.onTap,
    required this.isMobile,
  });

  final double width;
  final VoidCallback onTap;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isMobile ? width * 0.91 : width * 0.4197,
      height: isMobile ? width * 0.575 : width * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            'Pastebėjote šiukšlėmis užterštą teritoriją, kenkėjų apniktas egles ar kitą aplinkos pažeidimą? Praneškite mums!  Aplinkos apsaugos departamento pareigūnai išnagrinės pranešimą, suras pažeidėjus ir pasirūpins, kad jie pašalintų žalą.',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.roboto(
              fontSize: isMobile ? width * 0.0445 : width * 0.0125,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(224, 234, 232, 1),
            ),
          ),
          AddButton(
            width: width,
            onTap: onTap,
            isMobile: isMobile,
          )
        ],
      ),
    );
  }
}
