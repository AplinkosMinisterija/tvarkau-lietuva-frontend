import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RightSideFooterMobile extends StatelessWidget {
  const RightSideFooterMobile({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.15,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'tvarkaulietuva.lt',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff2a6354),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.005,
              ),
              SizedBox(
                width: width * 0.4,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Tai bandomoji sistemos versija, skirta viešinti visus Aplinkos\napsaugos departamentui žinomas ir potencialiai nelegalias\natliekų susidarymo vietas. Sistemoje suteikiama galimybė\nvisuomenei pranešti apie dar neužfiksuotas vietas, bei sekti\njų nagrinėjimo situaciją.',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apie aplinkosaugą galite\npasikonsultuoti darbo dienomis',
                maxLines: 2,
                style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: width * 0.005,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/phone_icon.svg',
                    height: width * 0.052,
                    width: width * 0.052,
                  ),
                  Text(
                    '8 700 02022',
                    style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/email_icon.svg',
                    height: width * 0.055,
                    width: width * 0.055,
                  ),
                  InkWell(
                    onTap: () {
                      LaunchUrl().launch(
                          'mailto:konsultacijos@aad.am.lt?subject=Konsultacija');
                    },
                    child: Text(
                      'konsultacijos@aad.am.lt',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.005),
                  SvgPicture.asset(
                    'assets/svg/exclamation_icon.svg',
                    height: width * 0.04,
                    width: width * 0.04,
                  ),
                  SizedBox(width: width * 0.01),
                  Text(
                    'Pastebėję galimą aplinkosauginį\npažeidimą, praneškite tel. 112',
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
