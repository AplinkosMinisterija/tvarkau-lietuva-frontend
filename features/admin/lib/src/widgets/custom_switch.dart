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
            trackOutlineWidth: WidgetStateProperty.all(0),
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
            trackColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return activeTrackColor;
              } else {
                return inactiveTrackColor;
              }
            }),
            thumbColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
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
