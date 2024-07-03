import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.width,
    required this.onTap,
  });

  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.4197,
      height: width * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pastebėjote šiukšlėmis užterštą teritoriją, kenkėjų apniktas egles ar kitą aplinkos pažeidimą? Praneškite mums!  Aplinkos apsaugos departamento pareigūnai išnagrinės pranešimą, suras pažeidėjus ir pasirūpins, kad jie pašalintų žalą.',
            style: GoogleFonts.poppins(
              fontSize: width * 0.0125,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(224, 234, 232, 1),
            ),
          ),
          AddButton(
            width: width,
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
