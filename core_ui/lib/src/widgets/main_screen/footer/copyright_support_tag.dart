import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CopyrightSupportTag extends StatelessWidget {
  const CopyrightSupportTag({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '© 2024, Tvarkau Lietuvą',
          style: GoogleFonts.roboto(
            fontSize: width * 0.01094,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        Row(
          children: <Widget>[
            SvgPicture.asset(
              'assets/svg/heart-flags.svg',
              width: width * 0.014,
              height: width * 0.014,
            ),
            SizedBox(width: width * 0.0078),
            Text(
              'AAD remia Ukrainą iki pergalės',
              style: GoogleFonts.roboto(
                fontSize: width * 0.01094,
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
