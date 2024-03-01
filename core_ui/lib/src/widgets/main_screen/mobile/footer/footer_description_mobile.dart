import 'package:flutter/material.dart';

class FooterDescriptionMobile extends StatelessWidget {
  const FooterDescriptionMobile({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'tvarkaulietuva.lt',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: width * 0.03888,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(57, 97, 84, 1),
            ),
          ),
          SizedBox(height: width * 0.022),
          SizedBox(
            width: width * 0.888,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Tai bandomoji sistemos versija, skirta Aplinkos apsaugos\ndepartamentui pranešti apie aplinkosauginius pažeidimus,\nkurie nereikalauja staigaus reagavimo ir vietas, kuriose\ndaroma žala aplinkai. Sistemoje galite pranešti apie dar\nneužfiksuotas vietas bei sekti jų nagrinėjimo procesą.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: width * 0.03333,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
