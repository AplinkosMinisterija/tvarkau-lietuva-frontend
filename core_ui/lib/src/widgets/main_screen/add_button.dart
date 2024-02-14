import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddButton extends StatefulWidget {
  const AddButton({required this.width, required this.onTap, super.key});

  final double width;
  final VoidCallback onTap;

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
        width: widget.width * 0.1411,
        height: widget.width * 0.0307,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: activeColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/icons/exclude.png',
              width: widget.width * 0.0083,
              height: widget.width * 0.0104,
              color: Colors.white,
            ),
            SizedBox(
              width: widget.width * 0.0083,
            ),
            SizedBox(
              width: widget.width * 0.0474,
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
            )
          ],
        ),
      ),
    );
  }
}
