import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/main_screen/mobile/left_side_footer_mobile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core/core.dart';

class LeftSideFooter extends StatelessWidget {
  const LeftSideFooter({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: FooterContactsMobile(width: width/2.6,)
    );
  }
}
