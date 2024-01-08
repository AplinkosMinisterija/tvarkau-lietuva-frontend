import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import 'package:api_client/api_client.dart';

class BaseTrashInfo extends StatelessWidget {
  const BaseTrashInfo({super.key, required this.trash});

  final FullReportDto trash;

  String getFormattedDate(DateTime unformattedDate) {
    String formattedDate =
        unformattedDate.add(const Duration(hours: 3)).toString();
    String day = formattedDate.substring(0, 10);
    String hour = formattedDate.substring(11, 16);
    return '$day $hour';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BuildColumn(title: 'Data', value: getFormattedDate(trash.reportDate)),
        _BuildColumn(title: 'El. paštas', value: trash.email),
        _BuildColumn(
          title: 'Platuma',
          value: trash.latitude.toString().length > 6
              ? trash.latitude.toString().substring(0, 7)
              : trash.latitude.toString(),
        ),
        _BuildColumn(
          title: 'Ilguma',
          value: trash.longitude.toString().length > 6
              ? trash.longitude.toString().substring(0, 7)
              : trash.longitude.toString(),
        ),
      ],
    );
  }
}

class _BuildColumn extends StatelessWidget {
  const _BuildColumn({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomStyles.body2.copyWith(
            color: CustomColors.white.withOpacity(.64),
          ),
        ),
        SelectionArea(
          child: Text(
            value,
            style: CustomStyles.body1.copyWith(
              color: CustomColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
