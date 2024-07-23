import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Copyright extends StatelessWidget {
  const Copyright({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.0828,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          '© 2024, Tvarkau Lietuvą',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            color: const Color(0xad0a3328),
          ),
        ),
      ),
    );
  }
}
