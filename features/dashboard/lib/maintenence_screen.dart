import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class MaintenenceScreen extends StatefulWidget {
  const MaintenenceScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MaintenenceScreen> createState() => _MaintenenceScreenState();
}

class _MaintenenceScreenState extends State<MaintenenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Tvarkau Lietuvą",
      color: Colors.redAccent,
      child: Scaffold(
        body: CupertinoPageScaffold(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: [
                  BackgroundWidget(width: constraints.maxWidth),
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
                        'Puslapis kuriamas',
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
