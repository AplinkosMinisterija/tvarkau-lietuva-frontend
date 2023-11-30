import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavePinButtonMobile extends StatefulWidget {
  const SavePinButtonMobile({
    super.key,
    required this.width,
    required this.isActive,
    required this.onTap,
    required this.onHover,
  });

  final double width;
  final bool isActive;
  final void Function()? onTap;
  final Function(bool) onHover;

  @override
  State<SavePinButtonMobile> createState() => _SavePinButtonMobileState();
}

class _SavePinButtonMobileState extends State<SavePinButtonMobile> {
  Color activeColor = const Color.fromRGBO(255, 255, 255, 1);
  Color inactiveColor = const Color.fromRGBO(255, 255, 255, 0.5);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isActive ? widget.onTap : () {},
      onHover: (isHover) {
        widget.onHover(isHover);
      },
      child: Container(
        width: widget.width * 0.8666,
        height: widget.width * 0.111,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border:
              Border.all(color: const Color.fromRGBO(57, 97, 84, 1), width: 1),
          color: widget.isActive ? activeColor : inactiveColor,
        ),
        child: Center(
          child: SizedBox(
            width: widget.width * 0.45,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "Išsaugoti pažymėtą vietą",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  color: widget.isActive
                      ? const Color.fromRGBO(57, 97, 84, 1)
                      : const Color.fromRGBO(57, 97, 84, 0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
