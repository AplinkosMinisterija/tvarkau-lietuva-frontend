import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportTable extends StatefulWidget {
  const ReportTable({
    super.key,
    required this.width,
    required this.reports,
    required this.onInformationTap,
  });

  final double width;
  final List<PublicReportDto> reports;
  final Function(String) onInformationTap;

  @override
  State<ReportTable> createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  List<PublicReportDto> reports = <PublicReportDto>[];
  late ReportDataSource reportDataSource;

  @override
  void initState() {
    super.initState();
    reports = widget.reports;
    reportDataSource = ReportDataSource(reportData: reports);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.width * 0.28,
      child: SfDataGrid(
        source: reportDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        allowSorting: true,
        allowFiltering: true,
        onCellTap: (DataGridCellDetails details) {
          if (details.rowColumnIndex.rowIndex != 0) {
            String onTapRef = reportDataSource
                .effectiveRows[details.rowColumnIndex.rowIndex - 1]
                .getCells()[0]
                .value;
            widget.onInformationTap(reports
                .firstWhere((element) => element.refId == onTapRef)
                .refId);
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
              width: widget.width * 0.15,
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
              columnName: 'comment',
              allowSorting: false,
              allowFiltering: true,
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'AAD atsakymas',
                    textAlign: TextAlign.center,
                  ))),
          GridColumn(
              columnName: 'category',
              allowSorting: false,
              allowFiltering: false,
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Kategorija',
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
        ],
      ),
    );
  }
}

class ReportDataSource extends DataGridSource {
  ReportDataSource({required List<PublicReportDto> reportData}) {
    _reportData = reportData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'ref', value: e.refId),
              DataGridCell<String>(
                  columnName: 'id',
                  value:
                      'TLP-A${'0' * (8 - e.refId.length)}${e.refId.toUpperCase()}'),
              DataGridCell<String>(
                  columnName: 'date',
                  value: FormatterUtils().formatDate(e.reportDate)),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'comment', value: e.comment),
              DataGridCell<String>(
                  columnName: 'category',
                  value: getCategoryText(e.category.name)),
              DataGridCell<String>(columnName: 'status', value: e.status),
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
            ? getStatusWidget(e.value)
            : e.columnName == 'date'
                ? Center(
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
                  )
                : e.columnName == 'id'
                    ? Text(
                        e.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        e.value.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
      );
    }).toList());
  }
}

Widget getStatusWidget(String status) {
  if (status == 'gautas') {
    return Container(
      height: 28,
      width: 64,
      decoration: getStatusBoxDecoration(
        const Color.fromRGBO(237, 12, 12, 1),
        const Color.fromRGBO(253, 225, 225, 1),
      ),
      child: Center(
        child: Text(
          'Gauta',
          style: getStatusBoxTextStyle(
            const Color.fromRGBO(237, 12, 12, 1),
          ),
        ),
      ),
    );
  } else if (status == 'tiriamas') {
    return Container(
      height: 28,
      width: 74,
      decoration: getStatusBoxDecoration(
        const Color.fromRGBO(255, 119, 0, 1),
        const Color.fromRGBO(255, 238, 224, 1),
      ),
      child: Center(
        child: Text(
          'Tiriama',
          style: getStatusBoxTextStyle(
            const Color.fromRGBO(255, 119, 0, 1),
          ),
        ),
      ),
    );
  } else if (status == 'išspręsta') {
    return Container(
      height: 28,
      width: 85,
      decoration: getStatusBoxDecoration(
        const Color.fromRGBO(0, 174, 6, 1),
        const Color.fromRGBO(224, 245, 224, 1),
      ),
      child: Center(
        child: Text(
          'Išspręsta',
          style: getStatusBoxTextStyle(
            const Color.fromRGBO(0, 174, 6, 1),
          ),
        ),
      ),
    );
  } else if (status == 'nepasitvirtino') {
    return Container(
      height: 28,
      width: 100,
      decoration: getStatusBoxDecoration(
        const Color.fromRGBO(100, 100, 100, 1.0),
        const Color.fromRGBO(220, 220, 220, 1.0),
      ),
      child: Center(
        child: Text(
          'Nepasitvirtino',
          style: getStatusBoxTextStyle(
            const Color.fromRGBO(100, 100, 100, 1.0),
          ),
        ),
      ),
    );
  } else {
    return const SizedBox.shrink();
  }
}

String getCategoryText(String category) {
  return switch (category) {
    'trash' => 'Atliekos',
    'forest' => 'Sugadinta miško paklotė ir keliai',
    'beetle' => 'Žievėgraužis',
    'permits' => 'Nelegalūs kirtimai',
    _ => '',
  };
}

BoxDecoration getStatusBoxDecoration(Color borderColor, Color fillColor) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      width: 1,
      color: borderColor,
    ),
    color: fillColor,
  );
}

TextStyle getStatusBoxTextStyle(Color textColor) {
  return GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textColor,
  );
}
