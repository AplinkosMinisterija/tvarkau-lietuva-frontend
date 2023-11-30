import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSaveButton extends StatefulWidget {
  const AdminSaveButton({
    super.key,
    required this.width,
    required this.onPressed,
  });

  final double width;
  final VoidCallback onPressed;

  @override
  State<AdminSaveButton> createState() => _AdminSaveButtonState();
}

class _AdminSaveButtonState extends State<AdminSaveButton> {
  Color backgroundColor = const Color.fromRGBO(21, 157, 0, 1.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (bool isHover) {
        setState(() {
          backgroundColor = isHover
              ? const Color.fromRGBO(13, 98, 0, 1.0)
              : const Color.fromRGBO(21, 157, 0, 1.0);
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
                  'Išsaugoti',
                  style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),
                ),
                SizedBox(width: widget.width * 0.01),
                const Icon(
                  Icons.save,
                  size: 15,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
