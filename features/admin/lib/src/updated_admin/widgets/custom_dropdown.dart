import 'package:flutter/material.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown(
      {super.key, required this.onChanged, required this.items});

  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T?>> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      items: const [],
      onChanged: onChanged,
      borderRadius: BorderRadius.circular(4),
      icon: const Icon(
        Icons.expand_more_rounded,
        color: CustomColors.red,
        size: 20,
      ),
      iconSize: 20,
      iconEnabledColor: CustomColors.red,
      underline: const SizedBox(),
      style: CustomStyles.body2.copyWith(
        color: CustomColors.red,
      ),
    );

    return Container(
      width: 144,
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: CustomColors.redMedium,
        border: Border.all(
          color: CustomColors.red,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Gautas',
              style: CustomStyles.body2.copyWith(
                color: CustomColors.red,
              ),
            ),
          ),
          4.widthBox,
          const Icon(
            Icons.expand_more_rounded,
            color: CustomColors.red,
            size: 20,
          ),
        ],
      ),
    );
  }
}
