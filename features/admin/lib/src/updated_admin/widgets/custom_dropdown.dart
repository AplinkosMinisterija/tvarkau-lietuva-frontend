import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
          color: CustomColors.white,
        ),
        color: CustomColors.greyMedium,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton2<T>(
        items: items,
        onChanged: onChanged,
        iconStyleData: const IconStyleData(
          iconEnabledColor: CustomColors.black,
        ),
        underline: const SizedBox(),
        style: CustomStyles.body2.copyWith(
          color: CustomColors.black,
        ),
        value: value,
      ),
    );
  }
}
