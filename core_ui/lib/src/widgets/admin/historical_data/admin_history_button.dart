import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domain/domain.dart';

import 'history_form.dart';

class AdminHistoryButton extends StatefulWidget {
  const AdminHistoryButton({
    required this.width,
    required this.onPressed,
    required this.report,
  });

  final double width;
  final VoidCallback onPressed;
  final ReportModel report;

  @override
  State<AdminHistoryButton> createState() => _AdminHistoryButtonState();
}

class _AdminHistoryButtonState extends State<AdminHistoryButton> {
  Color backgroundColor = const Color.fromRGBO(11, 180, 158, 1.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _addEditDialogBuilder(context, widget.width),
      onHover: (bool isHover) {
        setState(() {
          backgroundColor = isHover
              ? const Color.fromRGBO(10, 152, 133, 1.0)
              : const Color.fromRGBO(11, 180, 158, 1.0);
        });
      },
      child: Container(
          width: widget.width * 0.2,
          height: widget.width * 0.025,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(widget.width * 0.01),
          child: SizedBox(
            height: widget.width * 0.025,
            width: widget.width * 0.1,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                children: [
                  Text(
                    'Istoriniai duomenys',
                    style:
                        GoogleFonts.roboto(fontSize: 11, color: Colors.white),
                  ),
                  SizedBox(width: widget.width * 0.01),
                  const Icon(
                    Icons.history_toggle_off_outlined,
                    size: 15,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> _addEditDialogBuilder(BuildContext context, double width) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.all(5),
          contentPadding: const EdgeInsets.all(5),
          backgroundColor: const Color.fromRGBO(43, 97, 83, 0.7),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          children: [
            SizedBox(
              width: width / 1.5,
              child: HistoryForm(
                report: widget.report,
                onPressed: widget.onPressed,
              ),
            )
          ],
        );
      },
    );
  }
}
