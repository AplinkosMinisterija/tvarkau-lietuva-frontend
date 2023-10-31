import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domain/domain.dart';

class ReportEntryRow extends StatelessWidget {
  const ReportEntryRow({
    required this.width,
    required this.report,
    required this.onInformationTap,
  });

  final double width;
  final ReportModel report;
  final VoidCallback onInformationTap;

  @override
  Widget build(BuildContext context) {
    return report.isVisible!
        ? SizedBox(
            height: 60,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: width * 0.0963,
                      child: Text(
                        '${report.reportDate.toString().substring(0, 10)}\n${report.reportDate.toString().substring(11, 16)}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.0125,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.00833,
                    ),
                    SizedBox(
                      width: width * 0.1926,
                      child: Text(
                        report.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.0115,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.00833,
                    ),
                    SizedBox(
                      width: width * 0.0963,
                      child: Text(
                        report.comment ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.0115,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01666,
                    ),
                    SizedBox(
                        width: width * 0.0963,
                        child: getStatusText(report.status)),
                    SizedBox(
                      width: width * 0.00833,
                    ),
                    SizedBox(
                      width: width * 0.0963,
                      child: InkWell(
                        onTap: onInformationTap,
                        onHover: (isHover) {},
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.black,
                          size: width * 0.02,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  color: Color.fromRGBO(10, 51, 40, 0.1),
                )
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  Text getStatusText(String status) {
    String statusText = status[0].toUpperCase() + status.substring(1) ?? '';
    Color textColor;
    if (status == 'gautas') {
      textColor = Colors.red;
    } else if (status == 'tiriamas') {
      textColor = Colors.orange;
    } else if (status == 'ištirtas') {
      textColor = Colors.blue;
    } else if (status == 'nepasitvirtino') {
      textColor = Colors.grey;
    }else if (status == 'sutvarkyta') {
      textColor = Colors.green;
    }else {
      textColor = Colors.black;
    }
    return Text(
      statusText,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        fontSize: width * 0.0115,
        color: textColor,
      ),
    );
  }
}
