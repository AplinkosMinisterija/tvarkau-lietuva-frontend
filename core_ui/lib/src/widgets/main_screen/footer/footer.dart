import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.width,
    required this.isMobile,
    required this.onErrorReportPress,
  });

  final double width;
  final bool isMobile;
  final VoidCallback onErrorReportPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isMobile) ...[
          FooterContacts(width: width * 2.8273),
          SizedBox(height: width * 0.06388),
          FooterDescription(
            width: width,
            isMobile: isMobile,
          ),
          FooterConsultationInformation(
            width: width,
            isMobile: isMobile,
          ),
          SizedBox(height: width * 0.02167),
          AppButton(
            text: 'Pranešti apie sistemos klaidą',
            backgroundColor: const Color.fromRGBO(57, 97, 84, 0.07),
            textColor: Colors.black,
            onPressed: () {
              onErrorReportPress();
            },
          ),
          SizedBox(height: width * 0.02167),
        ] else ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FooterContacts(width: width),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FooterDescription(
                    width: width,
                    isMobile: isMobile,
                  ),
                  FooterConsultationInformation(
                    width: width,
                    isMobile: isMobile,
                  ),
                  Container(
                    width: width / 2,
                    padding: EdgeInsets.all(width * 0.005),
                    child: AppButton(
                      text: 'Pranešti apie sistemos klaidą',
                      backgroundColor: const Color.fromRGBO(57, 97, 84, 0.07),
                      textColor: Colors.black,
                      onPressed: () {
                        onErrorReportPress();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: width * 0.004),
        ],
        CopyrightSupportTag(
          width: width,
          isMobile: isMobile,
        ),
      ],
    );
  }
}
