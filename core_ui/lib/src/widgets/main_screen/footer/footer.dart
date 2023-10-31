import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';

class Footer extends StatelessWidget {
  const Footer({
    required this.width,
    required this.onDataSecurityTap,
  });

  final double width;
  final VoidCallback onDataSecurityTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FooterContactsMobile(
              width: width / 2.7,
            ),
            SizedBox(
              height: width * 0.02,
            ),
            InkWell(
              onTap: () {
                LaunchUrl()
                    .launch('https://aad.lrv.lt/lt/asmens-duomenu-apsauga');
              },
              //onDataSecurityTap,
              child: Text(
                'Departamento BDAR taisyklės',
                style: GoogleFonts.roboto(
                  fontSize: width / 2.7 * 0.03333,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FooterDescriptionMobile(width: width / 3.5),
            FooterConsultMobile(width: width / 3.5)
          ],
        )
      ],
    );
  }
}
