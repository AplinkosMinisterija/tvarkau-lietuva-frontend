import 'package:flutter/material.dart';
import '../../core_ui.dart';

class RouteErrorScreen extends StatelessWidget {
  final Function? onPressed;
  final String? errorText;

  const RouteErrorScreen({
    super.key,
    this.onPressed,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Nerastas puslapis",
      color: const Color.fromRGBO(28, 63, 58, 1),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
                      "Puslapis  tvarkaulietuva.lt$errorText  nerastas",
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
                text: 'Grįžti',
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
      ),
    );
  }
}
