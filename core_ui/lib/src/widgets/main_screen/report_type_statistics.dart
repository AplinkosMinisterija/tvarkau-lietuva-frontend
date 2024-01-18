import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportTypeStatistics extends StatelessWidget {
  const ReportTypeStatistics({
    super.key,
    required this.title,
    required this.quantity,
    required this.imageShort,
    required this.tooltipText,
  });

  final String title;
  final int quantity;
  final String imageShort;
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipText,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/marker_pins/${imageShort}_marker.png',
              width: 25,
              height: 25,
            ),
            Text(
              '$title: $quantity',
            )
          ],
        ),
      ),
    );
  }
}
