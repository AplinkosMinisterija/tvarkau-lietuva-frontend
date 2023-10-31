import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationScreenMobile extends StatelessWidget {
  const ConfirmationScreenMobile({required this.width, super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Tvarkau Lietuvą",
      color: Colors.green,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: width * 0.0125,
                ),
                Image.asset(
                  'assets/icons/aad-logo_black.png',
                  height: width * 0.1,
                  width: width * 0.930,
                ),
                SizedBox(
                  height: width * 0.0338,
                ),
                SizedBox(
                  width: width * 0.75,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Dėkojame už Jūsų pilietiškumą!',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.0338,
                ),
                Image.asset(
                  'assets/icons/confirm.png',
                  height: width * 0.312,
                  width: width * 0.312,
                ),
                SizedBox(
                  height: width * 0.0338,
                ),
                SizedBox(
                  width: width * 0.500,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Pranešimas sėkmingai gautas.',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.00625,
                ),
                SizedBox(
                  width: width * 0.75,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Aplinkos apsaugos departamento pareigūnai netrukus pradės\n darbuotis ieškodami pažeidėjo.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.04167,
                ),
                GestureDetector(
                  onTap: () {
                    context.goNamed("home");
                  },
                  child: Container(
                    width: width * 0.33,
                    height: width * 0.09,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffff6a3d)),
                    child: Center(
                      child: SizedBox(
                        width: width * 0.15,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Grįžti į svetainę',
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.0125,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
