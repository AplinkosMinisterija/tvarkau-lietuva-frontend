import 'package:flutter/material.dart';
import '../common/custom_styles.dart';
import '../common/custom_colors.dart';
import '../common/extensions.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.text,
    super.key,
    this.onPressed,
    this.textStyle,
    this.icon,
    this.iconColor = CustomColors.white,
  });

  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  final IconData? icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 15,
                color: iconColor,
              ),
              14.widthBox,
            ],
            Text(
              text,
              style: textStyle ?? CustomStyles.button1,
            ),
          ],
        ),
      ),
    );
  }
}
