import 'package:flutter/material.dart';

class ReportTitleBar extends StatelessWidget {
  const ReportTitleBar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: width * 0.0963,
          child: Text(
            'Pranešimo data\nir laikas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width * 0.009375,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.1926,
          child: Text(
            'Pranešimo\nturinys',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width * 0.009375,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.01666,
        ),
        SizedBox(
          width: width * 0.0963,
          child: Text(
            'AAD\natsakymas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width * 0.009375,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: Text(
            'Pranešimo\nstatusas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width * 0.009375,
              color: const Color(0x660a3328),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: Text(
            'Plačiau',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width * 0.009375,
              color: const Color(0x660a3328),
            ),
          ),
        ),
      ],
    );
  }
}
