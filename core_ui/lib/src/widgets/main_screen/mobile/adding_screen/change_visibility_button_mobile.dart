import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeVisibilityButtonMobile extends StatefulWidget {
  const ChangeVisibilityButtonMobile({
    super.key,
    required this.width,
    required this.isActive,
    required this.onTap,
    required this.onHover,
  });

  final double width;
  final bool isActive;
  final void Function()? onTap;
  final Function(bool) onHover;

  @override
  State<ChangeVisibilityButtonMobile> createState() =>
      _ChangeVisibilityButtonMobileState();
}

class _ChangeVisibilityButtonMobileState
    extends State<ChangeVisibilityButtonMobile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (isHover) {
        widget.onHover(isHover);
      },
      child: Container(
        width: widget.width * 0.6388,
        height: widget.width * 0.0888,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isActive
                ? Icon(
                    Icons.location_off_outlined,
                    size: widget.width * 0.0472,
                    color: const Color.fromRGBO(132, 132, 132, 1),
                  )
                : Icon(
                    Icons.location_on_outlined,
                    size: widget.width * 0.0472,
                    color: const Color.fromRGBO(132, 132, 132, 1),
                  ),
            SizedBox(width: widget.width * 0.0208),
            SizedBox(
              width: widget.width * 0.5138,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.isActive
                      ? "Slėpti patvirtintus pranešimus"
                      : "Rodyti patvirtintus pranešimus",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
