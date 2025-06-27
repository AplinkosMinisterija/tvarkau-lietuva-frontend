import 'package:flutter/material.dart';

import '../../core_ui.dart';

class NotFoundWidget extends StatelessWidget {
  final Function? onPressed;
  final String? errorText;
  final String? descriptionText;

  const NotFoundWidget({
    super.key,
    this.onPressed,
    this.errorText,
    this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromRGBO(232, 232, 232, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 35),
            child: Column(
              children: <Widget>[
                const Icon(
                  Icons.playlist_remove,
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
          Padding(
            padding: const EdgeInsets.all(24),
            child: AppButton(
              text: 'Grįžti į pagrindinį puslapį',
              backgroundColor: AppTheme.buttonDarkBgColor,
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                }
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
