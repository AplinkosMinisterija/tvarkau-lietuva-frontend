import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    super.key,
    this.buttonType = ButtonType.solid,
    this.onPressed,
    this.width = 144,
    this.height = 40,
    this.color = CustomColors.primary,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.textStyle,
    this.icon,
    this.padding,
  });

  final ButtonType buttonType;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color color;
  final String text;
  final BorderRadius borderRadius;
  final TextStyle? textStyle;
  final Widget? icon;
  final EdgeInsets? padding;

  BoxDecoration get _boxDecoration {
    switch (buttonType) {
      case ButtonType.solid:
        return BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        );
      case ButtonType.outlined:
        return BoxDecoration(
          border: Border.all(color: color),
          color: Colors.white,
          borderRadius: borderRadius,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: _boxDecoration,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: borderRadius,
            hoverColor: buttonType == ButtonType.solid
                ? CustomColors.white.withOpacity(0.1)
                : color.withOpacity(0.05),
            onTap: onPressed,
            child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      icon!,
                      4.widthBox,
                    ],
                    Text(text,
                        style: textStyle ??
                            CustomStyles.button2.copyWith(
                              color: buttonType == ButtonType.solid
                                  ? Colors.white
                                  : color,
                            )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonType {
  solid,
  outlined,
}
