import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
        height: widget.width * 0.0291,
        width: widget.width * 0.093,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: const Color(0xffff6a3d),
          ),
          color: widget.isActive ? const Color(0xffff6a3d) : activeColor,
        ),
        child: Center(
          child: SizedBox(
            width: widget.width * 0.07,
            child: AutoSizeText(
              widget.title,
              maxLines: 1,
              wrapWords: false,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: widget.isActive ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
