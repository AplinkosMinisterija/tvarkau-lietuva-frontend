import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddButtonMobile extends StatefulWidget {
  const AddButtonMobile({
    required this.width,
    required this.onTap,
    super.key,
  });

  final double width;
  final VoidCallback onTap;

  @override
  State<AddButtonMobile> createState() => _AddButtonMobileState();
}

class _AddButtonMobileState extends State<AddButtonMobile> {
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
        width: widget.width * 0.910,
        height: widget.width * 0.1330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: activeColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: widget.width * 0.0861,
              child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Icon(
                    Icons.add_location_sharp,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              width: widget.width * 0.03572,
            ),
            SizedBox(
              width: widget.width * 0.211,
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
