import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDeleteButton extends StatefulWidget {
  const AdminDeleteButton({
    super.key,
    required this.width,
    required this.onPressed,
  });

  final double width;
  final VoidCallback onPressed;

  @override
  State<AdminDeleteButton> createState() => _AdminDeleteButtonState();
}

class _AdminDeleteButtonState extends State<AdminDeleteButton> {
  Color backgroundColor = const Color.fromRGBO(190, 9, 9, 1.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (bool isHover) {
        setState(() {
          backgroundColor = isHover
              ? const Color.fromRGBO(162, 10, 10, 1.0)
              : const Color.fromRGBO(190, 9, 9, 1.0);
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
                  'Ištrinti',
                  style: GoogleFonts.roboto(fontSize: 11, color: Colors.white),
                ),
                SizedBox(width: widget.width * 0.01),
                const Icon(
                  Icons.delete_forever,
                  size: 15,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
