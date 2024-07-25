import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddButton extends StatefulWidget {
  const AddButton({
    required this.width,
    required this.onTap,
    required this.isMobile,
    super.key,
  });

  final double width;
  final VoidCallback onTap;
  final bool isMobile;

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  Color activeColor = const Color(0xffff6a3d);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            activeColor = const Color(0xffcb3b14);
          });
        } else {
          setState(() {
            activeColor = const Color(0xffff6a3d);
          });
        }
      },
      child: Container(
        width: widget.isMobile ? widget.width * 0.9112 : widget.width * 0.1411,
        height: widget.isMobile ? widget.width * 0.1334 : widget.width * 0.0307,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: activeColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/svg/add_icon.svg',
              height:
                  widget.isMobile ? widget.width * 0.06 : widget.width * 0.014,
            ),
            SizedBox(
              width: widget.isMobile
                  ? widget.width * 0.036
                  : widget.width * 0.0083,
            ),
            Text(
              'Pranešti',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: widget.isMobile
                    ? widget.width * 0.05
                    : widget.width * 0.0125,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
