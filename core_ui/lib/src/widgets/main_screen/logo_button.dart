import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoButton extends StatelessWidget {
  const LogoButton({
    required this.width,
    required this.onTap,
    this.alignment,
    super.key,
  });

  final double width;
  final VoidCallback onTap;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: alignment != null
          ? Align(
              alignment: alignment!,
              child: SvgPicture.asset(
                'assets/svg/TL_logo.svg',
                width: width,
              ),
            )
          : SvgPicture.asset(
              'assets/svg/TL_logo.svg',
              width: width,
            ),
    );
  }
}
