import 'package:domain/report/report_library.dart';
import 'package:flutter/material.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';

class BaseDumpInfo extends StatelessWidget {
  const BaseDumpInfo({super.key, required this.dump});

  final ReportModel dump;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BuildColumn(title: 'Data', value: dump.reportDate.toString()),
        _BuildColumn(title: 'El. paštas', value: dump.email ?? ''), //TODO check
        _BuildColumn(title: 'Platuma', value: dump.reportLat.toString()),
        _BuildColumn(title: 'Ilguma', value: dump.reportLong.toString()),
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
        Text(
          value,
          style: CustomStyles.body1.copyWith(
            color: CustomColors.white,
          ),
        ),
      ],
    );
  }
}
