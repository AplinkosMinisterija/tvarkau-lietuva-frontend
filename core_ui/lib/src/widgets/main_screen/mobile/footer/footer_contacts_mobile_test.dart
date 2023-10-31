import 'package:core/core.dart';
import 'package:core/utils/url_launcher.dart';
import 'package:core_ui/src/widgets/main_screen/mobile/footer/footer_contacts_left.dart';
import 'package:core_ui/src/widgets/main_screen/mobile/footer/footer_contacts_right.dart';
import 'package:flutter/material.dart';

class FooterContactsMobileTest extends StatelessWidget {
  const FooterContactsMobileTest({super.key,
  });


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
              width: 499 * 0.4442,
              height: 499 * 0.130,
              child: Image.asset('assets/icons/aad-logo_black.png'),
            ),
          ),
        ),
        const SizedBox(
          height: 499 * 0.044,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 499 * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               FooterContactsLeft(width: 499),
               FooterContactsRight(width: 499),
            ],
          ),
        ),
      ],
    );
  }
}
