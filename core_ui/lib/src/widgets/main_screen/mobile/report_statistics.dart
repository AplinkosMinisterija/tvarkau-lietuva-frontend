import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';

class ReportStatistics extends StatelessWidget {
  const ReportStatistics({
    super.key,
    required this.width,
    required this.reportStatistics,
    required this.isMobile,
  });

  final double width;
  final ReportStatisticsDto reportStatistics;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: isMobile
          ? Column(children: getStatWidgets(reportStatistics))
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getStatWidgets(reportStatistics)),
    );
  }

  List<Widget> getStatWidgets(ReportStatisticsDto stats) {
    List<Widget> statWidgets = [];
    statWidgets.add(getStatRow('Gauti', 'red', stats.totalSentReports,
        'Pranešimą peržiūrėjo tvarkaulietuva.lt administratorius ir jis perduotas atitinkamam struktūriniam vienetui tvarkyti.'));
    statWidgets.add(getStatRow(
        'Tiriami',
        'orange',
        stats.totalInInvestigationReports,
        'Atsakingas AAD struktūrinis padalinys vykdo pranešimo tyrimą.'));
    statWidgets.add(getStatRow(
        'Ištirti',
        'blue',
        stats.totalInvestigatedReports,
        'Pranešimas ištirtas ir tolimesniems veiksmams perduota vykdyti atsakingoms institucijoms.'));
    statWidgets.add(getStatRow(
        'Nepasitvirtinę',
        'gray',
        stats.totalFalseReports,
        'AAD atliko patikrinimą ir pažeidimo neužfiksavo.'));
    statWidgets.add(getStatRow('Sutvarkyti', 'green', stats.totalCleanedReports,
        'AAD užfiksavo pranešime nurodytą pažeidimą kaip sutvarkytą.'));
    return statWidgets;
  }

  Tooltip getStatRow(
      String title, String imageShort, num quantity, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/marker_pins/${imageShort}_marker.png',
              width: 25,
              height: 25,
            ),
            Text(
              '$title: $quantity',
            )
          ],
        ),
      ),
    );
  }
}
