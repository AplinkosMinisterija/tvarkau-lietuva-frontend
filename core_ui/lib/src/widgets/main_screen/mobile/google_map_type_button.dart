import 'package:flutter/material.dart';

class GoogleMapTypeButton extends StatefulWidget {
  const GoogleMapTypeButton({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  final double width;
  final double height;
  final VoidCallback onPressed;

  @override
  State<GoogleMapTypeButton> createState() => _GoogleMapTypeButtonState();
}

class _GoogleMapTypeButtonState extends State<GoogleMapTypeButton> {
  Color iconColor = const Color(0xff707070);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (bool isHover) {
        setState(() {
          iconColor = isHover
              ? const Color.fromRGBO(0, 0, 0, 1)
              : const Color(0xff707070);
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          Icons.layers,
          color: iconColor,
        ),
      ),
    );
  }
}
