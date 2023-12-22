import 'package:flutter/material.dart';

class LocationSearchButton extends StatefulWidget {
  const LocationSearchButton({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  final double width;
  final double height;
  final VoidCallback onPressed;

  @override
  State<LocationSearchButton> createState() => _LocationSearchButtonState();
}

class _LocationSearchButtonState extends State<LocationSearchButton> {
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
          Icons.my_location_outlined,
          color: iconColor,
        ),
      ),
    );
  }
}
