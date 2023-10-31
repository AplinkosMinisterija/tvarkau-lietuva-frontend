import 'package:core_ui/src/widgets/admin/reports/table/admin_reports_entry_row.dart';
import 'package:core_ui/src/widgets/admin/reports/table/admin_reports_title_bar.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../core_ui.dart';
import '../reports/table/report_edit_form.dart';
import 'admin_dumps_entry_row.dart';
import 'admin_dumps_title_bar.dart';
import 'dump_edit_form.dart';

class AdminDumpsTable extends StatefulWidget {
  const AdminDumpsTable({
    required this.width,
    required this.dumps,
    required this.onUpdate,
  });

  final double width;
  final List<ReportModel> dumps;
  final Function(ReportModel) onUpdate;

  @override
  State<AdminDumpsTable> createState() => _AdminDumpsTableState();
}

class _AdminDumpsTableState extends State<AdminDumpsTable> {
  List<ReportModel> dumps = <ReportModel>[];
  late DumpDataSourceAdmin dumpDataSource;

  @override
  void initState() {
    super.initState();
    dumps = widget.dumps;
    dumpDataSource = DumpDataSourceAdmin(dumpData: dumps);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.width * 0.5,
      color: Colors.white,
      child: SfDataGrid(
        source: dumpDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        allowSorting: true,
        allowFiltering: true,
        onCellTap: (DataGridCellDetails details) {
          if (details.rowColumnIndex.rowIndex != 0) {
            if (details.column.columnName == 'edit') {
              String onTapRef = dumpDataSource
                  .effectiveRows[details.rowColumnIndex.rowIndex - 1]
                  .getCells()[0]
                  .value;
              ReportModel selectedReport =
                  dumps.firstWhere((element) => element.id == onTapRef);
              _addEditDialogBuilder(context, widget.width, selectedReport);
            }
          }
        },
        columns: <GridColumn>[
          GridColumn(
              columnName: 'id',
              allowSorting: false,
              allowFiltering: false,
              visible: false,
              width: widget.width * 0.001,
              label: Container()),
          GridColumn(
              columnName: 'name',
              allowSorting: false,
              allowFiltering: true,
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Aikštelės pavadinimas',
                  ))),
          GridColumn(
              columnName: 'info',
              allowSorting: false,
              allowFiltering: true,
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Informacija',
                    textAlign: TextAlign.start,
                  ))),
          GridColumn(
              columnName: 'lat',
              allowSorting: false,
              allowFiltering: true,
              width: widget.width * 0.07,
              filterIconPadding: EdgeInsets.symmetric(horizontal: 2.0),
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
              filterIconPadding: EdgeInsets.symmetric(horizontal: 2.0),
              label: Container(
                  padding: const EdgeInsets.only(left: 5),
                  alignment: Alignment.center,
                  child: const Text(
                    'Ilguma',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ))),
          GridColumn(
              columnName: 'phone',
              allowSorting: false,
              allowFiltering: true,
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Telefono nr.',
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
      BuildContext context, double width, ReportModel dump) {
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
                child: DumpEditForm(
                  report: dump,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  onUpdate: (updatedModel) {
                    widget.onUpdate(updatedModel);
                  },
                ))
          ],
        );
      },
    );
  }
}

class DumpDataSourceAdmin extends DataGridSource {
  DumpDataSourceAdmin({required List<ReportModel> dumpData}) {
    _dumpData = dumpData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'info', value: e.moreInformation),
              DataGridCell<String>(
                  columnName: 'lat',
                  value: e.reportLat.toString().length > 6
                      ? e.reportLat.toString().substring(0, 7)
                      : e.reportLat.toString()),
              DataGridCell<String>(
                  columnName: 'long',
                  value: e.reportLong.toString().length > 6
                      ? e.reportLong.toString().substring(0, 7)
                      : e.reportLong.toString()),
              DataGridCell<String>(columnName: 'phone', value: e.phone ?? ''),
              DataGridCell<String>(
                  columnName: 'visibility',
                  value: e.isVisible! ? 'Rodomas' : 'Nerodomas'),
              const DataGridCell<String>(columnName: 'edit', value: 'edit'),
            ]))
        .toList();
  }

  List<DataGridRow> _dumpData = [];

  @override
  List<DataGridRow> get rows => _dumpData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: e.columnName == 'visibility'
            ? getVisibilityWidget(e.value)
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
