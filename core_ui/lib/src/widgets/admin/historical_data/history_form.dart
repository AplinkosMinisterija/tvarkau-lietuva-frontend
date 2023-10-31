import 'package:core_ui/src/widgets/admin/historical_data/edit_history_column.dart';
import 'package:core_ui/src/widgets/admin/historical_data/status_history_column.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domain/domain.dart';

class HistoryForm extends StatelessWidget {
  final ReportModel report;
  final VoidCallback onPressed;

  const HistoryForm({
    required this.report,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Text(
              'Istoriniai duomenys',
              style: GoogleFonts.roboto(
                fontSize: constraints.maxWidth * 0.05,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EditHistoryColumn(
                    report: report, width: constraints.maxWidth / 2),
                SizedBox(width: constraints.maxWidth * 0.1),
                StatusHistoryColumn(
                  report: report,
                  width: constraints.maxWidth / 2,
                )
              ],
            ),
          ],
        );
      },
    );
  }

  String formatDate(String unformattedDate) {
    DateTime formattedDate =
        DateTime.parse(unformattedDate).add(const Duration(hours: 3));
    String day = formattedDate.toString().substring(0, 10);
    String hour = formattedDate.toString().substring(11, 16);
    return '$day $hour';
  }

  TextStyle getInputStyle() {
    return GoogleFonts.roboto(fontSize: 20, color: Colors.black);
  }
}
