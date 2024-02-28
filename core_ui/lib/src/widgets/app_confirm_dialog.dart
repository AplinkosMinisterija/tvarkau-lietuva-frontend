import 'package:flutter/material.dart';
import '../../core_ui.dart';

class AppConfirmDialog extends StatelessWidget {
  final Function() onConfirm;
  final String confirmDescription;

  const AppConfirmDialog({
    required this.onConfirm,
    required this.confirmDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Confirm',
        style: AppTextTheme.manrope24Bold,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 40,
      ),
      titlePadding: const EdgeInsets.only(
        left: 50,
        right: 50,
        top: 40,
        bottom: 10,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              confirmDescription,
              style: AppTextTheme.manrope12Medium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        AppButton(
          text: 'Yes',
          backgroundColor: AppTheme.dangerousButtonBgColor,
          onPressed: onConfirm,
        ),
        const SizedBox(height: 12),
        AppButton(
          text: 'Cancel',
          backgroundColor: AppTheme.buttonBgColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
