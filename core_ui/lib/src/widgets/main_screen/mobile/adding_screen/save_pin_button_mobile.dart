import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavePinButtonMobile extends StatelessWidget {
  const SavePinButtonMobile({
    super.key,
    required this.width,
    required this.onTap,
    required this.onHover,
  });

  final double width;
  final void Function()? onTap;
  final Function(bool) onHover;

  final Color activeColor = const Color.fromRGBO(255, 255, 255, 1);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (isHover) {
        onHover(isHover);
      },
      child: Container(
        width: width * 0.8666,
        height: width * 0.111,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color.fromRGBO(57, 97, 84, 1), width: 1),
            color: activeColor),
        child: Center(
          child: SizedBox(
            width: width * 0.45,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "Išsaugoti pažymėtą vietą",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(57, 97, 84, 1)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
