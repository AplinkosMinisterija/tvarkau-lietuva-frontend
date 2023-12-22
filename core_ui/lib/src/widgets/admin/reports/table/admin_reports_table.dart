import 'package:api_client/api_client.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core_ui/src/widgets/admin/reports/table/report_edit_form.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart' as dio;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AdminReportsTable extends StatefulWidget {
  const AdminReportsTable({
    super.key,
    required this.width,
    required this.reports,
    required this.onUpdate,
  });

  final double width;
  final List<FullReportDto> reports;
  final Function(ReportModel, List<dio.MultipartFile>) onUpdate;

  @override
  State<AdminReportsTable> createState() => _AdminReportsTableState();
}

class _AdminReportsTableState extends State<AdminReportsTable> {
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
    return Column(
      children: [
        Text(
          reportDataSource.effectiveRows.isEmpty
              ? 'Pranešimų skaičius: ' + reportDataSource.rows.length.toString()
              : 'Pranešimų skaičius: ' +
                  reportDataSource.effectiveRows.length.toString(),
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
        ),
        const SizedBox(height: 20),
        Container(
          width: widget.width,
          height: widget.width * 0.5,
          color: Colors.white,
          child: SfDataGrid(
            source: reportDataSource,
            columnWidthMode: ColumnWidthMode.fill,
            allowSorting: true,
            allowFiltering: true,
            onFilterChanged: (DataGridFilterChangeDetails details) {
              setState(() {});
            },
            onCellTap: (DataGridCellDetails details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                if (details.column.columnName == 'edit') {
                  String onTapRef = reportDataSource
                      .effectiveRows[details.rowColumnIndex.rowIndex - 1]
                      .getCells()[0]
                      .value;
                  FullReportDto selectedReport = reports
                      .firstWhere((element) => element.refId == onTapRef);
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
                    'Pranešimo statusas',
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
      ),),
      ],
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
                child: ReportEditForm(
                  report: report,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  onUpdate: (updatedModel, officerFiles) {
                    widget.onUpdate(updatedModel, officerFiles);
                  },
                ))
          ],
        );
      },
    );
  }
}

String getFormattedDateAdmin(String unformattedDate) {
  DateTime formattedDate =
      DateTime.parse(unformattedDate).add(const Duration(hours: 3));
  String day = formattedDate.toString().substring(0, 10);
  String hour = formattedDate.toString().substring(11, 16);
  return '$day\n$hour';
}

class ReportDataSourceAdmin extends DataGridSource {
  ReportDataSourceAdmin({required List<FullReportDto> reportData}) {
    _reportData = reportData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'ref', value: e.refId),
              DataGridCell<String>(
                  columnName: 'id',
                  value:
                      'TLP-A${'0' * (8 - e.refId.length)}${e.refId.toUpperCase()}'),
              DataGridCell<String>(
                  columnName: 'date',
                  value: getFormattedDateAdmin(e.reportDate.toString())),
              DataGridCell<String>(
                  columnName: 'lat',
                  value: e.latitude.toString().length > 6
                      ? e.latitude.toString().substring(0, 7)
                      : e.latitude.toString()),
              DataGridCell<String>(
                  columnName: 'long',
                  value: e.longitude.toString().length > 6
                      ? e.longitude.toString().substring(0, 7)
                      : e.longitude.toString()),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'status', value: e.status),
              DataGridCell<String>(
                  columnName: 'visibility',
                  value: e.isVisible! ? 'Rodomas' : 'Nerodomas'),
              const DataGridCell<String>(columnName: 'edit', value: 'edit'),
            ]))
        .toList();
  }

  List<DataGridRow> _reportData = [];

  @override
  List<DataGridRow> get rows => _reportData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment:
            e.columnName == 'date' ? Alignment.centerLeft : Alignment.center,
        padding: e.columnName == 'date'
            ? const EdgeInsets.only(right: 50)
            : const EdgeInsets.all(8.0),
        child: e.columnName == 'status'
            ? getStatusWidgetAdmin(e.value)
            : e.columnName == 'visibility'
                ? getVisibilityWidget(e.value)
                : e.columnName == 'date'
                    ? Center(
                        child: SelectionArea(
                          child: Text(
                            e.value.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    : e.columnName == 'id'
                        ? SelectionArea(
                            child: Text(
                              e.value,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : e.columnName == 'edit'
                            ? Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(43, 180, 12, 1.0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(2),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Redaguoti',
                                        style: GoogleFonts.roboto(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.edit,
                                        size: 15,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ))
                            : SelectionArea(
                                child: Text(
                                  e.value.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
      );
    }).toList());
  }
}

Widget getVisibilityWidget(String isVisible) {
  return SizedBox(
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isVisible == 'Rodomas' ? Colors.green : Colors.red),
            height: 15,
            width: 15,
          ),
          const SizedBox(width: 15),
          AutoSizeText(
            isVisible,
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
  );
}

Widget getStatusWidgetAdmin(String status) {
  if (status == 'gautas') {
    return Container(
      height: 28,
      width: 64,
      decoration: getStatusBoxDecorationAdmin(
        const Color.fromRGBO(237, 12, 12, 1),
        const Color.fromRGBO(253, 225, 225, 1),
      ),
      child: Center(
        child: Text(
          'Gautas',
          style: getStatusBoxTextStyleAdmin(
            const Color.fromRGBO(237, 12, 12, 1),
          ),
        ),
      ),
    );
  } else if (status == 'tiriamas') {
    return Container(
      height: 28,
      width: 74,
      decoration: getStatusBoxDecorationAdmin(
        const Color.fromRGBO(255, 119, 0, 1),
        const Color.fromRGBO(255, 238, 224, 1),
      ),
      child: Center(
        child: Text(
          'Tiriamas',
          style: getStatusBoxTextStyleAdmin(
            const Color.fromRGBO(255, 119, 0, 1),
          ),
        ),
      ),
    );
  } else if (status == 'ištirtas') {
    return Container(
      height: 28,
      width: 64,
      decoration: getStatusBoxDecorationAdmin(
        const Color.fromRGBO(9, 126, 223, 1),
        const Color.fromRGBO(225, 239, 251, 1),
      ),
      child: Center(
        child: Text(
          'Ištirtas',
          style: getStatusBoxTextStyleAdmin(
            const Color.fromRGBO(9, 126, 223, 1),
          ),
        ),
      ),
    );
  } else if (status == 'nepasitvirtino') {
    return Container(
      height: 28,
      width: 100,
      decoration: getStatusBoxDecorationAdmin(
        const Color.fromRGBO(100, 100, 100, 1.0),
        const Color.fromRGBO(220, 220, 220, 1.0),
      ),
      child: Center(
        child: Text(
          'Nepasitvirtino',
          style: getStatusBoxTextStyleAdmin(
            const Color.fromRGBO(100, 100, 100, 1.0),
          ),
        ),
      ),
    );
  } else if (status == 'sutvarkyta') {
    return Container(
      height: 28,
      width: 95,
      decoration: getStatusBoxDecorationAdmin(
        const Color.fromRGBO(0, 174, 6, 1),
        const Color.fromRGBO(224, 245, 224, 1),
      ),
      child: Center(
        child: Text(
          'Sutvarkyta',
          style: getStatusBoxTextStyleAdmin(
            const Color.fromRGBO(0, 174, 6, 1),
          ),
        ),
      ),
    );
  } else {
    return const SizedBox.shrink();
  }
}

BoxDecoration getStatusBoxDecorationAdmin(Color borderColor, Color fillColor) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      width: 1,
      color: borderColor,
    ),
    color: fillColor,
  );
}

TextStyle getStatusBoxTextStyleAdmin(Color textColor) {
  return GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textColor,
  );
}
