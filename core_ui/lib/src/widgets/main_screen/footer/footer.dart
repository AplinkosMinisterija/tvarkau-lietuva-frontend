import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.width, required this.isMobile});

  final double width;
  final bool isMobile;

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
          SizedBox(height: width * 0.04167),
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
                  )
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
