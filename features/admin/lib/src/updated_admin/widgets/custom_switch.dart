import 'package:flutter/material.dart';
import '../common/custom_colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 24,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Theme(
          data: ThemeData(useMaterial3: true),
          child: Switch(
            trackOutlineWidth: MaterialStateProperty.all(0),
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            trackColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return CustomColors.primaryLight;
              } else {
                return CustomColors.redLight;
              }
            }),
            thumbColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return CustomColors.primary;
              } else {
                return CustomColors.red;
              }
            }),
            value: value,
            onChanged: (value) {
              onChanged?.call(value);
            },
          ),
        ),
      ),
    );
  }
}
