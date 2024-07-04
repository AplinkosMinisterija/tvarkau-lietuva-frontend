import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/home/ui/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isMapHover;

  @override
  void initState() {
    isMapHover = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return constraints.maxWidth > 900
          ? SingleChildScrollView(
              physics: isMapHover ? const NeverScrollableScrollPhysics() : null,
              child: Stack(
                children: [
                  BackgroundWidget(width: constraints.maxWidth),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.078125,
                      vertical: constraints.maxWidth * 0.03125,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/TL_logo.svg',
                              width: constraints.maxWidth * 0.3615,
                            ),
                            TitleWidget(
                              width: constraints.maxWidth,
                              onTap: () {
                                context.goNamed('report_category');
                              },
                            ),
                          ],
                        ),
                        MapScreen(
                            isMapHover: (isHover) {
                              setState(() {
                                isMapHover = isHover;
                              });
                            },
                            width: constraints.maxWidth),
                        SizedBox(height: constraints.maxWidth * 0.03125),
                        const Divider(
                          height: 1,
                          color: Color.fromRGBO(10, 51, 40, 0.1),
                        ),
                        SizedBox(height: constraints.maxWidth * 0.0343),
                        Footer(
                          width: constraints.maxWidth,
                        ),
                        SizedBox(height: constraints.maxWidth * 0.0166),
                        const Divider(
                          height: 1,
                          color: Color.fromRGBO(10, 51, 40, 0.1),
                        ),
                        SizedBox(height: constraints.maxWidth * 0.0166),
                        Row(
                          children: <Widget>[
                            Copyright(
                              width: constraints.maxWidth,
                            ),
                            const Spacer(),
                            SupportTag(
                              width: constraints.maxWidth,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ))
          : Container();
    });
  }
}
