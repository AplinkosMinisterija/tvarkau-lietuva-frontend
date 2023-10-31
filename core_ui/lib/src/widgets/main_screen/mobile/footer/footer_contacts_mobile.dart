import 'package:core/core.dart';
import 'package:core/utils/url_launcher.dart';
import 'package:core_ui/src/widgets/main_screen/mobile/footer/footer_contacts_left.dart';
import 'package:core_ui/src/widgets/main_screen/mobile/footer/footer_contacts_right.dart';
import 'package:flutter/material.dart';

class FooterContactsMobile extends StatelessWidget {
  const FooterContactsMobile({super.key, 
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              LaunchUrl().launch('https://aad.lrv.lt/');
            },
            child: SizedBox(
              width: width * 0.4442,
              height: width * 0.130,
              child: Image.asset('assets/icons/aad-logo_black.png'),
            ),
          ),
        ),
        SizedBox(
          height: width * 0.044,
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FooterContactsLeft(width: width),
              FooterContactsRight(width: width),
            ],
          ),
        ),
      ],
    );
  }
}
