import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExitHeader extends StatelessWidget {
  const ExitHeader({
    super.key,
    required this.width,
    required this.onTap,
  });

  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Pranešti apie pažeidimą',
          style: GoogleFonts.roboto(
            fontSize: width * 0.01458,
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Icon(
            Icons.close_sharp,
            size: width * 0.01666,
          ),
        ),
      ],
    );
  }
}
