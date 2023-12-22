import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class LeftSideFooter extends StatelessWidget {
  const LeftSideFooter({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
        child: FooterContactsMobile(
      width: width / 2.6,
    ));
  }
}
