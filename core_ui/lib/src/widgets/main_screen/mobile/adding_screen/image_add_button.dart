import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageAddButton extends StatefulWidget {
  const ImageAddButton({
    super.key,
    required this.width,
    required this.title,
    required this.onTap,
    required this.isMobile,
  });

  final double width;
  final String title;
  final void Function()? onTap;
  final bool isMobile;

  @override
  State<ImageAddButton> createState() => _ImageAddButtonState();
}

class _ImageAddButtonState extends State<ImageAddButton> {
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
        width: widget.isMobile ? widget.width * 0.911 : widget.width * 0.25625,
        height: widget.isMobile ? widget.width * 0.111 : widget.width * 0.02968,
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
                size: widget.isMobile
                    ? widget.width * 0.0461
                    : widget.width * 0.014,
                color: const Color.fromRGBO(57, 97, 84, 1),
              ),
              SizedBox(
                width: widget.isMobile
                    ? widget.width * 0.0305
                    : widget.width * 0.0078,
              ),
              Text(
                widget.title,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: widget.isMobile
                      ? widget.width * 0.0388
                      : widget.width * 0.0109,
                  color: const Color.fromRGBO(57, 97, 84, 1),
                ),
              ),
            ]),
      ),
    );
  }
}
