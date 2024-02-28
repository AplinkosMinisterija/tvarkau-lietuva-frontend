import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;

  final Color backgroundColor;
  final String text;

  final BorderSide? borderSide;
  final Color? onPressedBackgroundColor;
  final TextStyle? textStyle;
  final double? height;
  final bool isEnabled;
  final Color? disabledBackgroundColor;
  final String? disabledText;
  final TextStyle? disabledTextStyle;
  final Color? textColor;
  final AppIcon? icon;

  const AppButton({
    required this.text,
    required this.backgroundColor,
    this.onPressed,
    this.isEnabled = true,
    this.onPressedBackgroundColor,
    this.textStyle,
    this.borderSide,
    this.disabledBackgroundColor,
    this.disabledText,
    this.height,
    this.disabledTextStyle,
    this.textColor,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 45,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: borderSide ?? BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return isEnabled
                    ? onPressedBackgroundColor ?? backgroundColor
                    : disabledBackgroundColor ?? backgroundColor;
              } else {
                return isEnabled
                    ? backgroundColor
                    : disabledBackgroundColor ?? backgroundColor;
              }
            },
          ),
        ),
        onPressed: isEnabled ? onPressed : () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (icon != null) ...<Widget>{
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: icon!.call(
                  width: 16,
                  height: 16,
                  color: AppTheme.buttonTextColor,
                ),
              ),
            },
            Flexible(
              child: isEnabled
                  ? Text(
                      text,
                      style: textStyle ??
                          AppTextTheme.manrope18Regular.copyWith(
                            color: textColor ?? AppTheme.buttonTextColor,
                          ),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      disabledText != null ? disabledText! : text,
                      style: disabledTextStyle ??
                          textStyle ??
                          AppTextTheme.manrope18Regular.copyWith(
                            color: AppTheme.buttonTextColor,
                          ),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
