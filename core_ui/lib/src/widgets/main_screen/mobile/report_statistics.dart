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
              'Pranešimą peržiūrėjo tvarkaulietuva.lt administratorius ir jis perduotas atitinkamam struktūriniam vienetui tvarkyti.',
        ),
        ReportTypeStatistics(
          title: 'Tiriami',
          quantity: reportStatistics.totalInInvestigationReports,
          imageShort: 'orange',
          tooltipText:
              'Atsakingas AAD struktūrinis padalinys vykdo pranešimo tyrimą.',
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
          tooltipText: 'AAD atliko patikrinimą ir pažeidimo neužfiksavo.',
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
