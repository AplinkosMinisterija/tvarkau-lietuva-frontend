import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminViewSwitcherButton extends StatefulWidget {
  const AdminViewSwitcherButton({
    required this.width,
    required this.height,
    required this.type,
    required this.isActive,
    required this.onPressed,
  });

  final double width;
  final double height;
  final String type;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  State<AdminViewSwitcherButton> createState() =>
      _AdminViewSwitcherButtonState();
}

class _AdminViewSwitcherButtonState extends State<AdminViewSwitcherButton> {
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
        padding: EdgeInsets.all(widget.width * 0.1),
        child: FittedBox(
          fit: BoxFit.fill,
          child: widget.type == 'chart'
              ? const Icon(Icons.table_rows_outlined)
              : const Icon(Icons.map),
        ),
      ),
    );
  }
}
