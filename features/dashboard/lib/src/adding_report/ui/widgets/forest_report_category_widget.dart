import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForestReportCategoryWidget extends StatefulWidget {
  const ForestReportCategoryWidget({
    super.key,
    required this.onTap,
    required this.constraints,
    required this.title,
    required this.description,
    required this.iconName,
  });

  final VoidCallback onTap;
  final BoxConstraints constraints;
  final String title;
  final String description;
  final String iconName;

  @override
  State<ForestReportCategoryWidget> createState() =>
      _ForestReportCategoryWidgetState();
}

class _ForestReportCategoryWidgetState
    extends State<ForestReportCategoryWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (hoverState) {
        setState(() {
          isHover = hoverState;
        });
      },
      child: Container(
        width: widget.constraints.maxWidth / 3,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
          color:
              isHover ? const Color.fromRGBO(241, 241, 241, 1.0) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: isHover
                  ? const Offset(5, 9)
                  : const Offset(3, 7), // Shadow position
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
            vertical: widget.constraints.maxWidth * 0.009,
            horizontal: widget.constraints.maxWidth * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getIcon(
              widget.iconName,
              widget.constraints.maxWidth * 0.03,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.roboto(
                      fontSize: widget.constraints.maxWidth * 0.02,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: widget.constraints.maxWidth * 0.01),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: widget.constraints.maxWidth * 0.01,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(126, 126, 126, 1.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SvgPicture getIcon(String iconName, double size) {
    return SvgPicture.asset(
      'assets/svg/$iconName.svg',
      height: size,
      width: size,
      color: const Color.fromRGBO(70, 166, 0, 1.0),
    );
  }
}
