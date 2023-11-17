import 'package:flutter/material.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown(
      {super.key,
      required this.onChanged,
      required this.items,
      required this.value});

  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T>> items;
  final T value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.red,
        ),
        color: CustomColors.redMedium,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<T>(
        items: items,
        onChanged: onChanged,
        borderRadius: BorderRadius.circular(4),
        icon: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Icon(
            Icons.expand_more_rounded,
            color: CustomColors.red,
            size: 20,
          ),
        ),
        iconSize: 20,
        iconEnabledColor: CustomColors.red,
        underline: const SizedBox(),
        style: CustomStyles.body2.copyWith(
          color: CustomColors.red,
        ),
        value: value,
      ),
    );
  }
}
