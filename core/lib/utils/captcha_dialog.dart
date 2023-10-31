import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:google_fonts/google_fonts.dart';

class CaptchaDialog extends StatefulWidget {
  final Function() onSuccess;

  const CaptchaDialog({
    required this.onSuccess,
    Key? key,
  }) : super(key: key);

  @override
  State<CaptchaDialog> createState() => _CaptchaDialogState();
}

class _CaptchaDialogState extends State<CaptchaDialog> {
  final html.IFrameElement _iFrameElement = html.IFrameElement();

  @override
  void initState() {
    _iFrameElement.style.height = '100%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.src = 'assets/html/recaptcha.html';
    _iFrameElement.style.border = 'none';
    //_iFrameElement.csp = "default-src * unsafe-inline";

    //ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory('iframeElement', (int viewId) => _iFrameElement);

    html.window.onMessage.listen((msg) {
      widget.onSuccess();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Ar jūs esate robotas?',
            style:
                GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 500,
            width: 330,
            child: HtmlElementView(
              viewType: 'iframeElement',
              key: UniqueKey(),
            ),
          ),
        ],
      ),
    );
  }
}
