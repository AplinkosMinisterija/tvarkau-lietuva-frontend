import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExitHeader extends StatelessWidget {
  const ExitHeader({
    super.key,
    required this.width,
    required this.onTap,
    required this.title,
  });

  final double width;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: width * 0.0125,
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Icon(
            Icons.close_sharp,
            size: width * 0.0156,
          ),
        ),
      ],
    );
  }
}
