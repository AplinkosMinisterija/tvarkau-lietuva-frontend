import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: width,
          height: width * 0.430,
          color: const Color.fromRGBO(28, 63, 58, 1),
        ),
      ],
    );
  }
}
