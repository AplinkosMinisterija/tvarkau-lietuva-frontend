import 'package:flutter/material.dart';
import '../common/custom_colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeTrackColor = CustomColors.primaryLight,
    this.inactiveTrackColor = CustomColors.redLight,
    this.activeThumbColor = CustomColors.primary,
    this.inactiveThumbColor = CustomColors.red,
    this.width = 48,
    this.height = 24,
  });

  final bool value;
  final void Function(bool)? onChanged;

  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Theme(
          data: ThemeData(useMaterial3: true),
          child: Switch(
            trackOutlineWidth: MaterialStateProperty.all(0),
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            trackColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return activeTrackColor;
              } else {
                return inactiveTrackColor;
              }
            }),
            thumbColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return activeThumbColor;
              } else {
                return inactiveThumbColor;
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
