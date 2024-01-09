import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/custom_colors.dart';
import 'package:api_client/api_client.dart';
import '../common/custom_styles.dart';

class BaseTrashInfo extends StatelessWidget {
  const BaseTrashInfo({super.key, required this.trash});

  final FullReportDto trash;

  @override
  Widget build(BuildContext context) {
    String latitude = trash.latitude.toString().length > 6
        ? trash.latitude.toString().substring(0, 7)
        : trash.latitude.toString();
    String longitude = trash.longitude.toString().length > 6
        ? trash.longitude.toString().substring(0, 7)
        : trash.longitude.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BuildColumn(
            title: 'Data', value: DateFormatter().format(trash.reportDate)),
        _BuildColumn(title: 'El. paštas', value: trash.email),
        _BuildColumn(
          title: 'Platuma',
          value: latitude,
        ),
        _BuildColumn(
          title: 'Ilguma',
          value: longitude,
        ),
        IconButton(
            onPressed: () async {
              await Clipboard.setData(
                  ClipboardData(text: '$latitude $longitude'));
              // copied successfully
            },
            icon: const Icon(
              Icons.copy,
              color: Colors.white,
            ))
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
          overflow: TextOverflow.ellipsis,
          style: CustomStyles.body2.copyWith(
            color: CustomColors.white.withOpacity(.64),
          ),
        ),
        SelectionArea(
          child: Text(
            value,
            overflow: TextOverflow.clip,
            style: CustomStyles.body1.copyWith(
              color: CustomColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
