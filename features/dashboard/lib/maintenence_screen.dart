import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class MaintenenceScreen extends StatefulWidget {
  const MaintenenceScreen({
    super.key,
  });

  @override
  State<MaintenenceScreen> createState() => _MaintenenceScreenState();
}

class _MaintenenceScreenState extends State<MaintenenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Tvarkau Lietuvą",
      color: const Color.fromRGBO(28, 63, 58, 1),
      child: Scaffold(
        body: CupertinoPageScaffold(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: [
                  BackgroundWidget(
                    width: constraints.maxWidth,
                    isMobile: false,
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: constraints.maxWidth * 0.0291,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: DepartmentLogo(
                          width: constraints.maxWidth,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxWidth * 0.058,
                      ),
                      Text(
                        'Tvarkau Lietuvą',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 60,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxWidth * 0.0291,
                      ),
                      Text(
                        'Vyksta puslapio atnaujinimo darbai',
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
