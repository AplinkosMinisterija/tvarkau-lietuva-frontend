import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarkButton extends StatefulWidget {
  const MarkButton({
    super.key,
    required this.width,
    required this.onTap,
    required this.isActive,
  });

  final double width;
  final bool isActive;
  final void Function()? onTap;

  @override
  State<MarkButton> createState() => _MarkButtonState();
}

class _MarkButtonState extends State<MarkButton> {
  Color activeColor = const Color(0xffff6a3d);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            activeColor = const Color(0xffd7481f);
          });
        } else {
          setState(() {
            activeColor = const Color(0xffff6a3d);
          });
        }
      },
      onTap: widget.isActive ? widget.onTap : null,
      child: Container(
        width: widget.width * 0.22,
        height: widget.width * 0.0291,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.isActive ? activeColor : const Color(0xff6b6a6a),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/exclude.png',
                width: widget.width * 0.0083,
                height: widget.width * 0.0104,
              ),
              SizedBox(
                width: widget.width * 0.0083,
              ),
              SizedBox(
                width: widget.width * 0.0438,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Pranešti',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
