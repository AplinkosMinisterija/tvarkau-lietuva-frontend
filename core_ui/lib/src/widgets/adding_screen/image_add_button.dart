import 'package:flutter/material.dart';

class ImageAddButton extends StatefulWidget {
  const ImageAddButton({
    super.key,
    required this.width,
    required this.title,
    required this.onTap,
  });

  final double width;
  final String title;
  final void Function()? onTap;

  @override
  State<ImageAddButton> createState() => _ImageAddButtonState();
}

class _ImageAddButtonState extends State<ImageAddButton> {
  Color activeColor = const Color(0xffff6a3d);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
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
      child: Container(
        width: widget.width * 0.22,
        height: widget.width * 0.0291,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: activeColor,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.upload,
                size: widget.width * 0.015,
                color: Colors.white,
              ),
              SizedBox(
                width: widget.width * 0.0083,
              ),
              SizedBox(
                width: widget.width * 0.0838,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
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
