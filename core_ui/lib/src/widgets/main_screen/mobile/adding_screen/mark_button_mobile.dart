import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarkButtonMobile extends StatefulWidget {
  const MarkButtonMobile({
    super.key,
    required this.width,
    required this.onTap,
    required this.isActive,
  });

  final double width;
  final bool isActive;
  final void Function()? onTap;

  @override
  State<MarkButtonMobile> createState() => _MarkButtonMobileState();
}

class _MarkButtonMobileState extends State<MarkButtonMobile> {
  Color activeColor = const Color.fromRGBO(255, 106, 61, 1);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            activeColor = const Color.fromRGBO(225, 78, 35, 1.0);
          });
        } else {
          setState(() {
            activeColor = const Color.fromRGBO(255, 106, 61, 1);
          });
        }
      },
      onTap: widget.isActive ? widget.onTap : null,
      child: Container(
        width: widget.width * 0.911,
        height: widget.width * 0.1333,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.isActive ? activeColor : const Color(0xff6b6a6a),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add_location_sharp,
              color: Colors.white,
              size: widget.width * 0.0755,
            ),
            SizedBox(width: widget.width * 0.0361),
            SizedBox(
              width: widget.width * 0.211,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Pranešti',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
