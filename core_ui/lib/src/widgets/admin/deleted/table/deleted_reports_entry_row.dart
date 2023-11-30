import 'package:auto_size_text/auto_size_text.dart';
import 'package:core_ui/src/widgets/admin/admin_deleted_edit_button.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domain/domain.dart';

class DeletedReportsEntryRow extends StatefulWidget {
  const DeletedReportsEntryRow({
    super.key,
    required this.width,
    required this.report,
    required this.onUpdate,
  });

  final double width;
  final ReportModel report;
  final Function(ReportModel, List<http.MultipartFile>) onUpdate;

  @override
  State<DeletedReportsEntryRow> createState() => _DeletedReportsEntryRowState();
}

class _DeletedReportsEntryRowState extends State<DeletedReportsEntryRow> {
  Color backgroundColor = const Color.fromRGBO(255, 255, 255, 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.width * 0.043,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: widget.width * 0.01),
              SizedBox(
                width: widget.width * 0.0963,
                child: AutoSizeText(
                  '${widget.report.reportDate.toString().substring(0, 10)}\n${widget.report.reportDate.toString().substring(11, 16)}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: widget.width * 0.00833,
              ),
              SizedBox(
                width: widget.width * 0.0963,
                child: AutoSizeText(
                  widget.report.reportLong.toString().substring(0, 7),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: widget.width * 0.00833,
              ),
              SizedBox(
                width: widget.width * 0.0963,
                child: AutoSizeText(
                  widget.report.reportLat.toString().substring(0, 7),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: widget.width * 0.00833,
              ),
              SizedBox(
                width: widget.width * 0.0963,
                child: AutoSizeText(
                  widget.report.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: widget.width * 0.00833,
              ),
              SizedBox(
                width: widget.width * 0.0963,
                child: getStatusText(widget.report.status),
              ),
              SizedBox(
                width: widget.width * 0.00833,
              ),
              SizedBox(
                width: widget.width * 0.0963,
                height: widget.width * 0.015,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.report.isVisible!
                                ? Colors.green
                                : Colors.red),
                        height: widget.width * 0.009,
                        width: widget.width * 0.009,
                      ),
                      SizedBox(width: widget.width * 0.01),
                      AutoSizeText(
                        widget.report.isVisible! ? 'Rodomas' : 'Nerodomas',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: widget.width * 0.00833,
              ),
              SizedBox(
                  width: widget.width * 0.0863,
                  child: Center(
                    child: AdminDeletedEditButton(
                      type: 'report',
                      width: widget.width,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      onUpdate: (updatedModel, officerFiles) {
                        widget.onUpdate(updatedModel, officerFiles);
                      },
                      report: widget.report,
                    ),
                  )),
            ],
          ),
          const Divider(
            height: 1,
            color: Color.fromRGBO(10, 51, 40, 0.1),
          )
        ],
      ),
    );
  }

  AutoSizeText getStatusText(String status) {
    String statusText = widget.report.status[0].toUpperCase() +
        widget.report.status.substring(1);
    if (status == 'gautas') {
      return AutoSizeText(
        statusText,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.red,
        ),
      );
    } else if (status == 'tiriamas') {
      return AutoSizeText(
        statusText,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.orange,
        ),
      );
    } else if (status == 'ištirtas') {
      return AutoSizeText(
        statusText,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.blue,
        ),
      );
    } else if (status == 'nepasitvirtino') {
      return AutoSizeText(
        statusText,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.grey,
        ),
      );
    } else if (status == 'sutvarkyta') {
      return AutoSizeText(
        statusText,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.green,
        ),
      );
    } else {
      return AutoSizeText(
        statusText,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black,
        ),
      );
    }
  }
}
