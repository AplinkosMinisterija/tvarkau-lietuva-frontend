import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportTypeSwitcherButton extends StatefulWidget {
  const ReportTypeSwitcherButton({
    super.key,
    required this.width,
    required this.buttonText,
    required this.isActive,
    required this.isMobile,
    required this.onPressed,
  });

  final double width;
  final String buttonText;
  final bool isActive;
  final bool isMobile;
  final VoidCallback onPressed;

  @override
  State<ReportTypeSwitcherButton> createState() =>
      _ReportTypeSwitcherButtonState();
}

class _ReportTypeSwitcherButtonState extends State<ReportTypeSwitcherButton> {
  Color inactiveBackgroundColor = const Color.fromRGBO(255, 255, 255, 1);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (bool isHover) {
        setState(() {
          inactiveBackgroundColor = isHover
              ? const Color.fromRGBO(220, 220, 220, 1)
              : const Color.fromRGBO(255, 255, 255, 1);
        });
      },
      child: Container(
        width: widget.isMobile ? widget.width * 0.4167 : widget.width * 0.15,
        height: widget.isMobile ? widget.width * 0.0889 : widget.width * 0.032,
        decoration: BoxDecoration(
          color: widget.isActive
              ? const Color.fromRGBO(255, 106, 61, 1)
              : inactiveBackgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize:
                  widget.isMobile ? widget.width * 0.0306 : widget.width * 0.011,
              fontWeight: FontWeight.w400,
              color: widget.isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
