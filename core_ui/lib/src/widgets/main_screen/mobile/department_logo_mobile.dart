import 'package:flutter/material.dart';

class DepartmentLogoMobile extends StatelessWidget {
  const DepartmentLogoMobile({
    super.key,
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
