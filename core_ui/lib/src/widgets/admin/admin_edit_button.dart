import 'package:api_client/api_client.dart';
import 'package:core_ui/src/widgets/admin/reports/table/report_edit_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domain/domain.dart';
import 'package:http/http.dart' as http;
import 'dumps/dump_edit_form.dart';

class AdminEditButton extends StatefulWidget {
  const AdminEditButton({
    super.key,
    required this.width,
    required this.onPressed,
     this.report,
    this.dump,
    required this.onUpdate,
    required this.type,
  });

  final String type;
  final double width;
  final VoidCallback onPressed;
  final ReportModel? report;
  final FullDumpDto? dump;
  final Function(ReportModel, List<http.MultipartFile>) onUpdate;

  @override
  State<AdminEditButton> createState() => _AdminEditButtonState();
}

class _AdminEditButtonState extends State<AdminEditButton> {
  Color backgroundColor = const Color.fromRGBO(43, 180, 12, 1.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _addEditDialogBuilder(context, widget.width),
      onHover: (bool isHover) {
        setState(() {
          backgroundColor = isHover
              ? const Color.fromRGBO(32, 133, 9, 1.0)
              : const Color.fromRGBO(43, 180, 12, 1.0);
        });
      },
      child: Container(
          width: widget.width * 0.04,
          height: widget.width * 0.025,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(widget.width * 0.002),
          child: SizedBox(
            height: widget.width * 0.04,
            width: widget.width * 0.025,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Column(
                children: [
                  Text(
                    'Redaguoti',
                    style:
                        GoogleFonts.roboto(fontSize: 11, color: Colors.white),
                  ),
                  const Icon(
                    Icons.edit,
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
                width: width / 1.2,
                child:
                widget.report != null
                    ? ReportEditForm(
                        report: widget.report!,
                        onPressed: widget.onPressed,
                        onUpdate: (updatedModel, officerFiles) {
                          widget.onUpdate(updatedModel, officerFiles);
                        },
                      )
                    : DumpEditForm(
                        report: widget.dump!,
                        onPressed: widget.onPressed,
                        onUpdate: (updatedModel) {
                          widget.onUpdate(updatedModel, []);
                        }))
          ],
        );
      },
    );
  }
}
