import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:domain/domain.dart';

class EditHistoryColumn extends StatelessWidget {
  final ReportModel report;
  final double width;

  const EditHistoryColumn({
    required this.report,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Text(
        'Pakeitimų įrašai',
        style: GoogleFonts.roboto(
            fontSize: width * 0.05,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
      getHistoryColumn()
    ]));
  }

  Widget getHistoryColumn() {
    return Container(
        width: width * 0.8,
        height: width * 1.3,
        padding: EdgeInsets.all(width * 0.02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color.fromRGBO(222, 14, 14, 0.10196078431372549)),
        child: ListView.builder(
            itemCount:
                report.historyData != null ? report.historyData!.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: width * 0.01),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            size: width * 0.05,
                          ),
                          SizedBox(width: width * 0.02),
                          Text(
                            formatDate(report.historyData![index].date ?? ''),
                            style: GoogleFonts.roboto(fontSize: width * 0.05),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: width * 0.05,
                          ),
                          SizedBox(width: width * 0.02),
                          Text(
                            report.historyData![index].user ?? '',
                            style: GoogleFonts.roboto(fontSize: width * 0.03),
                          ),
                        ],
                      ),
                      getChangeBox(report.historyData![index].edits ?? [])
                    ],
                  ),
                ),
              );
            }));
  }

  Widget getChangeBox(List<Edits> editData) {
    return Container(
      height: width * 0.12 * editData.length,
      color: const Color.fromRGBO(183, 183, 183, 1.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: editData.isNotEmpty ? editData.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: width * 0.01),
              child: getChangeWidget(
                  editData[index].field!, editData[index].change!, context),
            );
          }),
    );
  }

  Widget getChangeWidget(String field, String change, BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(67, 124, 50, 1.0));

    return Container(
      width: width * 0.9,
      decoration: decoration,
      child: Column(
        children: [
          Container(
              decoration: decoration, child: getTitleText(field, width * 0.03)),
          Container(
              decoration: decoration,
              child: getChangeText(change, field, width * 0.04, context))
        ],
      ),
    );
  }

  Text getTitleText(String title, double fontSize) {
    String titleText;
    if (title == 'name') {
      titleText = 'Pakeistas pranešimo turinys į';
    } else if (title == 'reportLong') {
      titleText = 'Pakeista pranešimo koordinačių ilguma į';
    } else if (title == 'reportLat') {
      titleText = 'Pakeista pranešimo koordinačių platuma į';
    } else if (title == 'comment') {
      titleText = 'Pakeistas AAD atsakymas į';
    } else if (title == 'isVisible') {
      titleText = ' ';
    } else if (title == 'isDeleted') {
      titleText = ' ';
    } else if (title == 'status') {
      titleText = 'Pranešimo statusas pakeistas į ';
    } else if (title == 'officerImages') {
      titleText = 'Pridėtos pareigūnų nuotraukos. Kiekis:';
    } else {
      titleText = '';
    }
    return Text(
      titleText,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  Widget getChangeText(
      String change, String title, double fontSize, BuildContext context) {
    String changeText;
    if (title == 'name' ||
        title == 'reportLong' ||
        title == 'reportLat' ||
        title == 'comment') {
      changeText = change;
    } else if (title == 'isVisible' && change == 'false') {
      changeText = 'Pranešimas padarytas nematomu';
    } else if (title == 'isVisible' && change == 'true') {
      changeText = 'Pranešimas padarytas matomu';
    } else if (title == 'isDeleted' && change == 'true') {
      changeText = 'Pranešimas ištrintas';
    } else if (title == 'isDeleted' && change == 'false') {
      changeText = 'Pranešimas atkurtas';
    } else if (title == 'status') {
      changeText = change.toUpperCase();
    } else if (title == 'officerImages') {
      changeText = change.toUpperCase();
    } else {
      changeText = '';
    }
    if (title == 'name' || title == 'comment') {
      return InkWell(
        onTap: () => _expandTextDialogBuilder(
          context,
          width,
          change,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width * 0.6,
              child: Center(
                child: Text(
                  changeText,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.roboto(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.expand_outlined,
              size: width * 0.05,
              color: Colors.white,
            )
          ],
        ),
      );
    } else {
      return Text(
        changeText,
        style: GoogleFonts.roboto(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      );
    }
  }

  String formatDate(String unformattedDate) {
    DateTime formattedDate =
        DateTime.parse(unformattedDate).add(const Duration(hours: 3));
    String day = formattedDate.toString().substring(0, 10);
    String hour = formattedDate.toString().substring(11, 16);
    return '$day $hour';
  }

  Future<void> _expandTextDialogBuilder(
      BuildContext context, double width, String text) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.all(5),
          contentPadding: const EdgeInsets.all(5),
          backgroundColor: const Color.fromRGBO(43, 97, 83, 0.85),
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
                child: Text(
                  text,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.1,
                    color: Colors.white,
                  ),
                ))
          ],
        );
      },
    );
  }
}
