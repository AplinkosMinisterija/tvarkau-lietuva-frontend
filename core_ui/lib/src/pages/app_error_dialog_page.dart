import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppErrorDialogFeature {
  static Page<dynamic> page(String errorTitle, String errorDescription) => AppErrorDialogPage(
        errorTitle: errorTitle,
        errorDescription: errorDescription,
      );
}

class AppErrorDialogPage extends Page<void> {
  String errorTitle;
  String errorDescription;

  AppErrorDialogPage({
    required this.errorTitle,
    required this.errorDescription,
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute<void>(
      barrierDismissible: false,
      context: context,
      settings: this,
      builder: (BuildContext context) {
        return AppErrorDialog(
          errorTitle: errorTitle,
          errorDescription: errorDescription,
        );
      },
    );
  }
}
