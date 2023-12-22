import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:dio/dio.dart' as dio;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../core_ui.dart';
import 'deleted_edit_form.dart';

class DeletedReportsTable extends StatefulWidget {
  const DeletedReportsTable({
    super.key,
    required this.width,
    required this.reports,
    required this.onUpdate,
    required this.activeEmail,
  });

  final double width;
  final List<FullReportDto> reports;
  final String activeEmail;
  final Function(ReportModel, String, List<dio.MultipartFile>) onUpdate;

  @override
  State<DeletedReportsTable> createState() => _DeletedReportsTableState();
}

class _DeletedReportsTableState extends State<DeletedReportsTable> {
  List<FullReportDto> reports = <FullReportDto>[];
  late ReportDataSourceAdmin reportDataSource;
  Color backgroundColor = const Color.fromRGBO(43, 180, 12, 1.0);

  @override
  void initState() {
    super.initState();
    reports = widget.reports;
    reportDataSource = ReportDataSourceAdmin(reportData: reports);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.width * 0.5,
      color: Colors.white,
      child: SfDataGrid(
        source: reportDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        allowSorting: true,
        allowFiltering: true,
        onCellTap: (DataGridCellDetails details) {
          if (details.rowColumnIndex.rowIndex != 0) {
            if (details.column.columnName == 'edit') {
              String onTapRef = reportDataSource
                  .effectiveRows[details.rowColumnIndex.rowIndex - 1]
                  .getCells()[0]
                  .value;
              FullReportDto selectedReport =
                  reports.firstWhere((element) => element.refId == onTapRef);
              _addEditDialogBuilder(context, widget.width, selectedReport);
            }
          }
        },
        columns: <GridColumn>[
          GridColumn(
              columnName: 'ref',
              allowSorting: false,
              allowFiltering: false,
              visible: false,
              width: widget.width * 0.001,
              label: Container()),
          GridColumn(
              columnName: 'id',
              allowSorting: true,
              allowFiltering: true,
              width: widget.width * 0.12,
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Pranešimo ID',
                  ))),
          GridColumn(
              columnName: 'date',
              allowSorting: true,
              allowFiltering: false,
              width: widget.width * 0.1,
              label: Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Pranešimo data ir laikas',
                    textAlign: TextAlign.start,
                  ))),
          GridColumn(
              columnName: 'lat',
              allowSorting: false,
              allowFiltering: true,
              width: widget.width * 0.07,
              filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              label: Container(
                  padding: const EdgeInsets.only(left: 5),
                  alignment: Alignment.center,
                  child: const Text(
                    'Platuma',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ))),
          GridColumn(
              columnName: 'long',
              allowSorting: false,
              allowFiltering: true,
              width: widget.width * 0.07,
              filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              label: Container(
                  padding: const EdgeInsets.only(left: 5),
                  alignment: Alignment.center,
                  child: const Text(
                    'Ilguma',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ))),
          GridColumn(
              columnName: 'name',
              allowSorting: false,
              allowFiltering: true,
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Pranešimo turinys',
                    textAlign: TextAlign.center,
                  ))),
          GridColumn(
              columnName: 'status',
              allowSorting: true,
              allowFiltering: true,
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Statusas',
                    textAlign: TextAlign.center,
                  ))),
          GridColumn(
              columnName: 'visibility',
              allowSorting: true,
              allowFiltering: true,
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Matomumas',
                    textAlign: TextAlign.center,
                  ))),
          GridColumn(
              columnName: 'edit',
              allowSorting: false,
              allowFiltering: false,
              width: widget.width * 0.05,
              label: Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Veiksmai',
                    textAlign: TextAlign.center,
                  ))),
        ],
      ),
    );
  }

  Future<void> _addEditDialogBuilder(
      BuildContext context, double width, FullReportDto report) {
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
                child: DeletedEditForm(
                  report: report,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  onUpdate: (updatedModel, officerFiles) {
                    widget.onUpdate(
                        updatedModel, widget.activeEmail, officerFiles);
                  },
                ))
          ],
        );
      },
    );
  }
}
