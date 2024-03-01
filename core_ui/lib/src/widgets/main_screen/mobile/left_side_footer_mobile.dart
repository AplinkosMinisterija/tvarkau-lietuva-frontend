import 'package:flutter/material.dart';
import 'package:core/core.dart';

class LeftSideFooterMobile extends StatelessWidget {
  const LeftSideFooterMobile({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            LaunchUrl().launch('https://aad.lrv.lt/');
          },
          child: Image.asset(
            'assets/icons/aad-logo_black_long.png',
            width: width * 0.5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: width * 0.25,
              child: const FittedBox(
                fit: BoxFit.fitWidth,
                child: Column(
                  children: <Widget>[
                    Text(
                      'ADRESU:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0x660a3328),
                      ),
                    ),
                    SelectionArea(
                      child: Text(
                        'Biudžetinė įstaiga,\nSmolensko g. 15,\n03201 Vilnius',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: width * 0.05),
            SizedBox(
              width: width * 0.2,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Column(
                  children: <Widget>[
                    const Text(
                      'TELEFONAS:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0x660a3328),
                      ),
                    ),
                    const SelectionArea(
                      child: Text(
                        '(85) 216 3385',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: width * 0.01),
                    const Text(
                      'EL. PAŠTAS:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0x660a3328),
                      ),
                    ),
                    const SelectionArea(
                      child: Text(
                        'info@aad.am.lt',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: width * 0.05),
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    LaunchUrl().launch(
                        'https://www.facebook.com/aplinkosapsaugosdepartamentas/');
                  },
                  child: Image.asset(
                    'assets/icons/facebook.png',
                    height: width * 0.05,
                    width: width * 0.05,
                  ),
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch(
                        'https://www.linkedin.com/company/aplinkos-apsaugos-departamentas/');
                  },
                  child: Image.asset(
                    'assets/icons/linkedin.png',
                    height: width * 0.05,
                    width: width * 0.05,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
