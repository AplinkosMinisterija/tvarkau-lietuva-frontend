import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CopyrightSupportTag extends StatelessWidget {
  const CopyrightSupportTag({
    super.key,
    required this.width,
    required this.isMobile,
  });

  final double width;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '© 2024, Tvarkau Lietuvą',
          style: GoogleFonts.roboto(
            fontSize: isMobile ? width * 0.033 : width * 0.01094,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        Row(
          children: <Widget>[
            SvgPicture.asset(
              'assets/svg/heart-flags.svg',
              width: isMobile ? width * 0.037 : width * 0.014,
            ),
            SizedBox(width: isMobile ? width * 0.00667 : width * 0.0078),
            Text(
              'AAD remia Ukrainą iki pergalės',
              style: GoogleFonts.roboto(
                fontSize: isMobile ? width * 0.033 : width * 0.01094,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            )
          ],
        )
      ],
    );
  }
}
