import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportTag extends StatelessWidget {
  const SupportTag({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          'assets/icons/lithuania.png',
          height: width * 0.0114,
          width: width * 0.0166,
        ),
        SizedBox(
          width: width * 0.00416,
        ),
        Image.asset(
          'assets/icons/plus.png',
          height: width * 0.003125,
          width: width * 0.003125,
        ),
        SizedBox(
          width: width * 0.00416,
        ),
        Image.asset(
          'assets/icons/ukraine.png',
          height: width * 0.0114,
          width: width * 0.0166,
        ),
        SizedBox(
          width: width * 0.00625,
        ),
        SizedBox(
          width: width * 0.105,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'AAD remia Ukrainą iki pergalės',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
