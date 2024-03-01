import 'package:flutter/material.dart';

class ImageAddButtonAdmin extends StatefulWidget {
  const ImageAddButtonAdmin({
    super.key,
    required this.width,
    required this.title,
    required this.onTap,
  });

  final double width;
  final String title;
  final void Function()? onTap;

  @override
  State<ImageAddButtonAdmin> createState() => _ImageAddButtonAdminState();
}

class _ImageAddButtonAdminState extends State<ImageAddButtonAdmin> {
  Color activeColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            activeColor = const Color(0xFF149806);
          });
        } else {
          setState(() {
            activeColor = Colors.green;
          });
        }
      },
      child: Container(
        width: widget.width * 0.911,
        height: widget.width * 0.111,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white, width: 1),
          color: activeColor,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.file_download_outlined,
                  size: widget.width * 0.0461, color: Colors.white),
              SizedBox(
                width: widget.width * 0.0305,
              ),
              SizedBox(
                width: widget.width * 0.333,
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
