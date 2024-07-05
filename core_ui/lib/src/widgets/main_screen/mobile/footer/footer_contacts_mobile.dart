import 'package:core/core.dart';
import 'package:core/utils/url_launcher.dart';
import 'package:core_ui/src/widgets/main_screen/mobile/footer/footer_contacts_left.dart';
import 'package:core_ui/src/widgets/main_screen/mobile/footer/footer_contacts_right.dart';
import 'package:flutter/material.dart';

class FooterContactsMobile extends StatelessWidget {
  const FooterContactsMobile({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.3015,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              LaunchUrl().launch('https://aad.lrv.lt/');
            },
            child: SizedBox(
              width: width * 0.18,
              height: width * 0.0523,
              child: Image.asset('assets/icons/aad-logo_black.png'),
            ),
          ),
          SizedBox(
            height: width * 0.0247,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FooterContactsLeft(width: width),
              FooterContactsRight(width: width),
            ],
          ),
        ],
      ),
    );
  }
}
