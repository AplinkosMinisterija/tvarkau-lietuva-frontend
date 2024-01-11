import 'package:flutter/material.dart';

import '../../core_ui.dart';

class ErrorReloadWidget extends StatelessWidget {
  final Function? onPressed;
  final String? errorText;
  final String? descriptionText;

  const ErrorReloadWidget({
    super.key,
    this.onPressed,
    this.errorText,
    this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 35),
            child: Column(
              children: <Widget>[
                const Icon(
                  Icons.error,
                  size: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 80,
                  ),
                  child: Text(
                    errorText ?? 'Klaida',
                    style: AppTextTheme.ploni16medium.copyWith(
                      color: AppTheme.defaultTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 80,
                  ),
                  child: Text(
                    descriptionText ?? '',
                    style: AppTextTheme.ploni16medium.copyWith(
                      color: AppTheme.defaultTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: AppButton(
              text: 'Perkrauti',
              backgroundColor: AppTheme.buttonDarkBgColor,
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
