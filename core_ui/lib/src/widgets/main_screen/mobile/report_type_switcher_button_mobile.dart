import 'package:flutter/material.dart';

class ReportTypeSwitcherButtonMobile extends StatefulWidget {
  const ReportTypeSwitcherButtonMobile({
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
  State<ReportTypeSwitcherButtonMobile> createState() =>
      _ReportTypeSwitcherButtonMobileState();
}

class _ReportTypeSwitcherButtonMobileState
    extends State<ReportTypeSwitcherButtonMobile> {
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
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.all(widget.width * 0.025),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: widget.isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
