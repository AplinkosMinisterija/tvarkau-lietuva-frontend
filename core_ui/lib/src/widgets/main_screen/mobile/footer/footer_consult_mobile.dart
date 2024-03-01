import 'package:core/utils/url_launcher.dart';
import 'package:flutter/material.dart';

class FooterConsultMobile extends StatelessWidget {
  const FooterConsultMobile({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.432,
      width: width * 0.911,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(57, 97, 84, 0.07),
          borderRadius: BorderRadius.circular(14)),
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: SelectionArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Apie aplinkosaugą galite pasikonsultuoti\ndarbo dienomis',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: width * 0.03888,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(57, 97, 84, 1),
                ),
              ),
            ),
            SizedBox(height: width * 0.0472),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  size: width * 0.05,
                  color: const Color.fromRGBO(57, 97, 84, 1),
                ),
                SizedBox(width: width * 0.0416),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch('tel:+870002022');
                  },
                  child: Text(
                    '8 700 02022',
                    style: TextStyle(
                        fontSize: width * 0.03333, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(width: width * 0.0311),
                Icon(
                  Icons.email,
                  size: width * 0.05,
                  color: const Color.fromRGBO(57, 97, 84, 1),
                ),
                SizedBox(width: width * 0.0416),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch(
                        'mailto:konsultacijos@aad.am.lt?subject=Konsultacija');
                  },
                  child: Text(
                    'konsultacijos@aad.am.lt',
                    style: TextStyle(
                        fontSize: width * 0.03333, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: width * 0.0444),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.campaign,
                  size: width * 0.05,
                  color: const Color.fromRGBO(255, 106, 61, 1),
                ),
                SizedBox(width: width * 0.0416),
                InkWell(
                  onTap: () {
                    LaunchUrl().launch('tel:+112');
                  },
                  child: Text(
                    'Pastebėję galimą aplinkosauginį pažeidimą,\npraneškite tel. 112',
                    style: TextStyle(
                        fontSize: width * 0.03333, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
