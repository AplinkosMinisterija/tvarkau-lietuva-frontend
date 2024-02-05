import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UrgentWarningWidget extends StatelessWidget {
  const UrgentWarningWidget({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth / 1.8,
      height: constraints.maxWidth / 8,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(250, 204, 62, 1.0),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 0), // Shadow position
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
          vertical: constraints.maxWidth * 0.009,
          horizontal: constraints.maxWidth * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning,
                color: const Color.fromRGBO(250, 204, 62, 1.0),
                size: constraints.maxWidth * 0.03,
              ),
              SizedBox(width: constraints.maxWidth * 0.012),
              Text(
                'Ar šiuo metu reikalinga pagalba?',
                style: GoogleFonts.roboto(
                  fontSize: constraints.maxWidth * 0.02,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: constraints.maxWidth * 0.012),
          Padding(
            padding: EdgeInsets.only(left: constraints.maxWidth * 0.042),
            child: RichText(
              text: TextSpan(
                text:
                    'Jeigu Jums ar kitiems žmonėms yra reali grėsmė gyvybei, sveikatai ar saugumui, Jūsų turtui kyla reali grėmsmė (kėsinamasi pagrobti Jūsų automobilį, kėsinamasi sugadinti ar sunaikinti Jūsų turtą), šiuo metu matote vykstančias muštynes, ',
                style: DefaultTextStyle.of(context).style.copyWith(
                      fontSize: constraints.maxWidth * 0.012,
                    ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'skambinkite 112.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxWidth * 0.013,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
