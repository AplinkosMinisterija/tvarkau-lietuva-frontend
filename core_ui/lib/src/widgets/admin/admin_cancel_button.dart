import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminCancelButton extends StatefulWidget {
  const AdminCancelButton({
    super.key,
    required this.width,
    required this.onPressed,
  });

  final double width;
  final VoidCallback onPressed;

  @override
  State<AdminCancelButton> createState() => _AdminCancelButtonState();
}

class _AdminCancelButtonState extends State<AdminCancelButton> {
  Color backgroundColor = const Color.fromRGBO(211, 126, 0, 1.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (bool isHover) {
        setState(() {
          backgroundColor = isHover
              ? const Color.fromRGBO(178, 108, 0, 1.0)
              : const Color.fromRGBO(211, 126, 0, 1.0);
        });
      },
      child: Container(
          width: widget.width * 0.1,
          height: widget.width * 0.03,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(widget.width * 0.01),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
              children: [
                Text(
                  'Atšaukti',
                  style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),
                ),
                SizedBox(width: widget.width * 0.01),
                const Icon(
                  Icons.cancel,
                  size: 15,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
