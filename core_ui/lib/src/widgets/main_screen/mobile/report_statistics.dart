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
          title: 'Gauta',
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
          title: 'Išspręsti',
          quantity: reportStatistics.totalInvestigatedReports,
          imageShort: 'green',
          tooltipText:
              'Pranešimas ištirtas ir pažeidėjas įpareigotas pašalinti pažeidimą ar atlyginti padarytą žalą aplinkai.',
        ),
        ReportTypeStatistics(
          title: 'Nepasitvirtinę',
          quantity: reportStatistics.totalFalseReports,
          imageShort: 'gray',
          tooltipText: 'Atlikus teritorijos apžiūrą, pažeidimas neužfiksuotas.',
        ),

      ],
    );
  }
}
