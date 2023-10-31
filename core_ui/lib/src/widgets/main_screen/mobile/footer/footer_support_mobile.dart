import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FooterSupportMobile extends StatelessWidget {
  const FooterSupportMobile({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.3555,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              '© 2023, Tvarkau Lietuvą',
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/heart-flags.svg',
              height: width * 0.0339,
              width: width * 0.0370,
            ),
            SizedBox(width: width * 0.0064),
            SizedBox(
              width: width * 0.4555,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'AAD remia Ukrainą iki pergalės',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
