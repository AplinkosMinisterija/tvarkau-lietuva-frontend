import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';

import '../report_type_statistics.dart';

class ReportStatistics extends StatelessWidget {
  const ReportStatistics({
    super.key,
    required this.reportStatistics,
  });

  final ReportStatisticsDto reportStatistics;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 5,
      children: [
        ReportTypeStatistics(
          title: 'Gauti',
          quantity: reportStatistics.totalSentReports,
          imageShort: 'red',
          tooltipText:
              'Pranešimas perduotas Aplinkos apsaugos departamento pareigūnams.',
        ),
        ReportTypeStatistics(
          title: 'Tiriami',
          quantity: reportStatistics.totalInInvestigationReports,
          imageShort: 'orange',
          tooltipText:
              'Vykdomas pranešimo tyrimas.',
        ),
        ReportTypeStatistics(
          title: 'Ištirti',
          quantity: reportStatistics.totalInvestigatedReports,
          imageShort: 'blue',
          tooltipText:
              'Pranešimas ištirtas ir tolimesniems veiksmams perduota vykdyti atsakingoms institucijoms.',
        ),
        ReportTypeStatistics(
          title: 'Nepasitvirtinę',
          quantity: reportStatistics.totalFalseReports,
          imageShort: 'gray',
          tooltipText: 'Atlikus teritorijos apžiūrą, pažeidimas neužfiksuotas.',
        ),
        ReportTypeStatistics(
          title: 'Sutvarkyti',
          quantity: reportStatistics.totalCleanedReports,
          imageShort: 'green',
          tooltipText:
              'AAD užfiksavo pranešime nurodytą pažeidimą kaip sutvarkytą.',
        ),
      ],
    );
  }
}
