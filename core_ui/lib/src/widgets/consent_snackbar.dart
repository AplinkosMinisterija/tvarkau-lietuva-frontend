import 'package:core/utils/secure_storage_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core_ui.dart';

showConsentSnackbar(BuildContext context, VoidCallback onPress, bool isMobile,
    {bool onlyShowIfNotSet = true}) async {
  final existingConsentValue = await SecureStorageProvider().getUserConsent();
  if (onlyShowIfNotSet && existingConsentValue != null) {
    debugPrint(
        'consent is already set to $existingConsentValue: not showing dialog');

    return;
  }
  final snackBar = SnackBar(
    backgroundColor: const Color.fromRGBO(21, 45, 43, 1.0),
    content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Jūsų asmens duomenų valdymas',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          RichText(
              text: TextSpan(
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(224, 234, 232, 1),
                  ),
                  children: [
                const TextSpan(
                    text: 'Šioje svetainėje yra naudojami slapukai',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: ' (angl. cookies).'),
                const TextSpan(text: ' Paspausdami'),
                const TextSpan(
                    text: ' Sutinku ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: 'jūs sutinkate su '),
                TextSpan(
                    text:
                        'Aplinkos apsaugos departamento slapukų naudojimo taisyklėmis.',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrl(Uri.parse(
                          'https://aad.lrv.lt/lt/slapuku-naudojimo-taisykles/'))),
                // use your own instead
              ])),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: isMobile ? 0 : 35),
                child: SizedBox(
                  width: 120,
                  child: AppButton(
                    text: 'Sutinku',
                    backgroundColor: const Color(0xffff6a3d),
                    onPressed: () async {
                      await SecureStorageProvider().setUserConsent('all');
                      onPress();
                    },
                  ),
                ),
              ),
            ],
          ),
        ]),
    duration: const Duration(seconds: 9999999),
  );
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
