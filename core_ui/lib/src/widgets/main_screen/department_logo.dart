import 'package:auto_size_text/auto_size_text.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';
import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DepartmentLogo extends StatelessWidget {
  const DepartmentLogo({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          LaunchUrl().launch('https://aad.lrv.lt/');
      },
      child: SizedBox(
        width: width * 0.170,
        height: width * 0.04,
        child: Image.asset('assets/icons/aad-logo.png'),
      ),
    );
  }
}
