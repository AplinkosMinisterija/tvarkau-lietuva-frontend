import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    required this.width,
    required this.onTap,
  });

  final double width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.049,
        height: width * 0.0307,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Center(
          child: SizedBox(
            width: width * 0.0323,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Atšaukti',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
