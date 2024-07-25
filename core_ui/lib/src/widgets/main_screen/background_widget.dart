import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.width,
    required this.isMobile,
  });

  final double width;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: width,
          height: isMobile ? width * 1.533 : width * 0.430,
          color: const Color.fromRGBO(28, 63, 58, 1),
        ),
      ],
    );
  }
}
