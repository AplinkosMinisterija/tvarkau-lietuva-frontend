import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LayerTypeButton extends StatefulWidget {
  const LayerTypeButton({
    super.key,
    required this.width,
    required this.title,
    required this.isActive,
    this.onHover,
    required this.onTap,
  });

  final double width;
  final bool isActive;
  final String title;
  final void Function() onTap;
  final Function(bool)? onHover;

  @override
  State<LayerTypeButton> createState() => _LayerTypeButtonState();
}

class _LayerTypeButtonState extends State<LayerTypeButton> {
  Color activeColor = Colors.transparent;
  late bool isActive;

  @override
  void initState() {
    isActive = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
        widget.onTap();
      },
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            activeColor = Colors.black12;
          });
        } else {
          setState(() {
            activeColor = Colors.transparent;
          });
        }
      },
      child: Container(
        width: widget.width,
        height: widget.width * 0.1,
        padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: activeColor,
            border: Border.all(
                color: const Color.fromRGBO(222, 224, 224, 1), width: 1)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.roboto(
                fontSize: widget.width * 0.03,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Checkbox(
              value: isActive,
              activeColor: const Color.fromRGBO(28, 63, 58, 1),
              onChanged: (val) {
                setState(() {
                  isActive = !isActive;
                });
                widget.onTap();
              },
            )
          ],
        ),
      ),
    );
  }
}