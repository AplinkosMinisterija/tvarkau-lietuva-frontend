import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.0828,
      child: const FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          '© 2024, Tvarkau Lietuvą',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xad0a3328),
          ),
        ),
      ),
    );
  }
}
