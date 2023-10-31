import 'package:auto_size_text/auto_size_text.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';
import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DepartmentLogoMobile extends StatelessWidget {
  const DepartmentLogoMobile({
    required this.width,
    required this.onTap,
  });

  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width * 0.425,
        height: width * 0.111,
        child: Image.asset('assets/icons/aad-logo.png'),
      ),
    );
  }
}
