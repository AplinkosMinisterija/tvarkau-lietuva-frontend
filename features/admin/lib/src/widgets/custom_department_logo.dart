import 'package:core/core.dart';
import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';

class CustomDepartmentLogo extends StatelessWidget {
  const CustomDepartmentLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LaunchUrl().launch('https://aad.lrv.lt/');
      },
      child: SizedBox(
        width: 200,
        height: 58,
        child: Image.asset('assets/icons/aad-logo.png'),
      ),
    );
  }
}
