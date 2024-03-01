import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({required this.width, super.key});

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
                  height: width * 0.05,
                  width: width * 0.415,
                ),
                SizedBox(
                  height: width * 0.0338,
                ),
                SizedBox(
                  width: width * 0.2823,
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Dėkojame už Jūsų pilietiškumą!',
                      style: TextStyle(
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
                  height: width * 0.104,
                  width: width * 0.104,
                ),
                SizedBox(
                  height: width * 0.0338,
                ),
                SizedBox(
                  width: width * 0.150,
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Pranešimas sėkmingai gautas.',
                      style: TextStyle(
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
                  width: width * 0.25,
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Aplinkos apsaugos departamento pareigūnai netrukus pradės\n darbuotis ieškodami pažeidėjo.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                    width: width * 0.11,
                    height: width * 0.0291,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffff6a3d)),
                    child: Center(
                      child: SizedBox(
                        width: width * 0.06,
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Grįžti į svetainę',
                            style: TextStyle(
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
