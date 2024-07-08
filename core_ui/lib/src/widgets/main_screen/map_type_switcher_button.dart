import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapTypeSwitcherButton extends StatefulWidget {
  const MapTypeSwitcherButton({
    super.key,
    required this.width,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final double width;
  final String title;
  final bool isActive;
  final void Function()? onTap;

  @override
  State<MapTypeSwitcherButton> createState() => _MapTypeSwitcherButtonState();
}

class _MapTypeSwitcherButtonState extends State<MapTypeSwitcherButton> {
  Color activeColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            activeColor = Colors.black12;
          });
        } else {
          setState(() {
            activeColor = Colors.transparent;
          });
        }
      },
      child: Container(
        height: widget.width * 0.025,
        width: widget.width * 0.077,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(255, 106, 61, 1),
          ),
          color: widget.isActive
              ? const Color.fromRGBO(255, 106, 61, 1)
              : activeColor,
        ),
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: widget.width * 0.009375,
              color: widget.isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
