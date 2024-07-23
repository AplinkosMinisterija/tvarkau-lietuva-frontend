import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportTypeSwitcherButton extends StatefulWidget {
  const ReportTypeSwitcherButton({
    super.key,
    required this.width,
    required this.height,
    required this.buttonText,
    required this.isActive,
    required this.onPressed,
  });

  final double width;
  final double height;
  final String buttonText;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  State<ReportTypeSwitcherButton> createState() =>
      _ReportTypeSwitcherButtonState();
}

class _ReportTypeSwitcherButtonState extends State<ReportTypeSwitcherButton> {
  Color inactiveBackgroundColor = const Color(0xffe3e3e3);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (bool isHover) {
        setState(() {
          inactiveBackgroundColor =
              isHover ? const Color(0xffb7b7b7) : const Color(0xffe3e3e3);
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.isActive
              ? const Color(0xffff6a3d)
              : inactiveBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(2),
        child: Text(
          widget.buttonText,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
