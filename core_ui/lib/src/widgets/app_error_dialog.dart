import 'package:flutter/material.dart';
import '../../core_ui.dart';

class AppErrorDialog extends StatelessWidget {
  final String errorTitle;
  final String errorDescription;

  const AppErrorDialog({
    required this.errorTitle,
    required this.errorDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        errorTitle,
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
              errorDescription,
              style: AppTextTheme.manrope12Medium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        AppButton(
          text: 'OK',
          backgroundColor: AppColors.royalBlue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
