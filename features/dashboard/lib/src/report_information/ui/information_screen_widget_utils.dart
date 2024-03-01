import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationScreenWidgetUtils {
  Widget getStatusWidget(String status, double width) {
    if (status == 'gautas') {
      return Container(
        height: width * 0.07777,
        width: width * 0.17777,
        decoration: getStatusBoxDecoration(
          const Color.fromRGBO(237, 12, 12, 1),
          const Color.fromRGBO(253, 225, 225, 1),
        ),
        child: Center(
          child: SizedBox(
            width: width * 0.1222,
            child: FittedBox(
              child: Text(
                'Gauta',
                style: getStatusBoxTextStyle(
                  const Color.fromRGBO(237, 12, 12, 1),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (status == 'tiriamas') {
      return Container(
        height: width * 0.07777,
        width: width * 0.2055,
        decoration: getStatusBoxDecoration(
          const Color.fromRGBO(255, 119, 0, 1),
          const Color.fromRGBO(255, 238, 224, 1),
        ),
        child: Center(
          child: SizedBox(
            width: width * 0.15,
            child: FittedBox(
              child: Text(
                'Tiriama',
                style: getStatusBoxTextStyle(
                  const Color.fromRGBO(255, 119, 0, 1),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (status == 'išspręsta') {
      return Container(
        height: width * 0.07777,
        width: width * 0.17777,
        decoration: getStatusBoxDecoration(
          const Color.fromRGBO(0, 174, 6, 1),
          const Color.fromRGBO(224, 245, 224, 1),
        ),
        child: Center(
          child: SizedBox(
            width: width * 0.1222,
            child: FittedBox(
              child: Text(
                'Išspręsta',
                style: getStatusBoxTextStyle(
                  const Color.fromRGBO(0, 174, 6, 1),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (status == 'nepasitvirtino') {
      return Container(
        height: width * 0.07777,
        width: width * 0.2477,
        decoration: getStatusBoxDecoration(
          const Color.fromRGBO(100, 100, 100, 1.0),
          const Color.fromRGBO(220, 220, 220, 1.0),
        ),
        child: Center(
          child: SizedBox(
            width: width * 0.1922,
            child: FittedBox(
              child: Text(
                'Nepasitvirtino',
                style: getStatusBoxTextStyle(
                  const Color.fromRGBO(100, 100, 100, 1.0),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  BoxDecoration getStatusBoxDecoration(Color borderColor, Color fillColor) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 1,
        color: borderColor,
      ),
      color: fillColor,
    );
  }

  TextStyle getStatusBoxTextStyle(Color textColor) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textColor,
    );
  }
}
