import 'package:core_ui/src/widgets/main_screen/mobile/right_side_footer_mobile.dart';
import 'package:flutter/material.dart';
import 'left_side_footer_mobile.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LeftSideFooterMobile(
          width: width,
        ),
        SizedBox(height: width * 0.01),
        const Divider(height: 1),
        SizedBox(height: width * 0.01),
        RightSideFooterMobile(
          width: width,
        ),
      ],
    );
  }
}
