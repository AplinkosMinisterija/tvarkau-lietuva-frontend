import 'package:core/utils/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataSecurityTermsButton extends StatelessWidget {
  const DataSecurityTermsButton({
    super.key,
    required this.onTap,
    required this.width,
    required this.isTermsAccepted,
  });

  final Function(bool?) onTap;
  final double width;
  final bool isTermsAccepted;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: const Color.fromRGBO(57, 97, 84, 1),
      title: SizedBox(
          width: width * 0.2,
          child: RichText(
            text: TextSpan(
                text: 'Sutinku su departamento ',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: width * 0.03,
                ),
                children: [
                  TextSpan(
                    text: 'asmens duomenų apsaugos tvarkymo taisyklėmis',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.03,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => LaunchUrl().launch(
                          'https://aad.lrv.lt/lt/asmens-duomenu-apsauga/'),
                  )
                ]),
          )),
      value: isTermsAccepted,
      onChanged: onTap,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
