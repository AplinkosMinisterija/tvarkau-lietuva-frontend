import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppConfirmDialogFeature {
  static Page<dynamic> page({
    required String confirmDescription,
    required Function() onConfirm,
  }) =>
      AppConfirmDialogPage(
        onConfirm: onConfirm,
        confirmDescription: confirmDescription,
      );
}

class AppConfirmDialogPage extends Page<void> {
  final String confirmDescription;
  final Function() onConfirm;

  const AppConfirmDialogPage({
    required this.onConfirm,
    required this.confirmDescription,
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute<void>(
      barrierDismissible: false,
      context: context,
      settings: this,
      builder: (BuildContext context) {
        return AppConfirmDialog(
          onConfirm: onConfirm,
          confirmDescription: confirmDescription,
        );
      },
    );
  }
}
