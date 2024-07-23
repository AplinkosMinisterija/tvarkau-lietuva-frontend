import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageAddButtonMobile extends StatefulWidget {
  const ImageAddButtonMobile({
    super.key,
    required this.width,
    required this.title,
    required this.onTap,
  });

  final double width;
  final String title;
  final void Function()? onTap;

  @override
  State<ImageAddButtonMobile> createState() => _ImageAddButtonMobileState();
}

class _ImageAddButtonMobileState extends State<ImageAddButtonMobile> {
  Color activeColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            activeColor = const Color(0x28b7b7b7);
          });
        } else {
          setState(() {
            activeColor = Colors.transparent;
          });
        }
      },
      child: Container(
        width: widget.width * 0.911,
        height: widget.width * 0.111,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border:
              Border.all(color: const Color.fromRGBO(57, 97, 84, 1), width: 1),
          color: activeColor,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.file_download_outlined,
                size: widget.width * 0.0461,
                color: const Color.fromRGBO(57, 97, 84, 1),
              ),
              SizedBox(
                width: widget.width * 0.0305,
              ),
              SizedBox(
                width: widget.width * 0.333,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    widget.title,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(57, 97, 84, 1),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
