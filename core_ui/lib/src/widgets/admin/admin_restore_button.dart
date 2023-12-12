import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminRestoreButton extends StatefulWidget {
  const AdminRestoreButton({
    super.key,
    required this.width,
    required this.onPressed,
  });

  final double width;
  final VoidCallback onPressed;

  @override
  State<AdminRestoreButton> createState() => _AdminRestoreButtonState();
}

class _AdminRestoreButtonState extends State<AdminRestoreButton> {
  Color backgroundColor = const Color.fromRGBO(7, 71, 203, 1.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (bool isHover) {
        setState(() {
          backgroundColor = isHover
              ? const Color.fromRGBO(7, 60, 169, 1.0)
              : const Color.fromRGBO(7, 71, 203, 1.0);
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
                  'Atkurti',
                  style: GoogleFonts.roboto(fontSize: 11, color: Colors.white),
                ),
                SizedBox(width: widget.width * 0.01),
                const Icon(
                  Icons.restore,
                  size: 15,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
