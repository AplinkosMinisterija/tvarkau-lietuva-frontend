import 'package:flutter/material.dart';
import '../common/custom_colors.dart';

class BaseAdminScreen extends StatelessWidget {
  const BaseAdminScreen({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;
      return SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height * 0.4,
              color: CustomColors.primary,
            ),
            child
          ],
        ),
      );
    });
  }
}
