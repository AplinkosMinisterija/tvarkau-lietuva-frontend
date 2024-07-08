import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/home/ui/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeLayoutMobile extends StatefulWidget {
  const HomeLayoutMobile({
    required this.scrollOffset,
    required this.width,
    super.key,
  });

  final double scrollOffset;
  final double width;

  @override
  State<HomeLayoutMobile> createState() => _HomeLayoutMobileState();
}

class _HomeLayoutMobileState extends State<HomeLayoutMobile> {
  late bool isMapHover;
  late ScrollController scrollController;

  Future<void> updateScrollControllerOffset(double offset) async {
    await SecureStorageProvider().setScrollOffset(offset);
  }

  @override
  void initState() {
    scrollController =
        ScrollController(initialScrollOffset: widget.scrollOffset);
    isMapHover = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification) {
          updateScrollControllerOffset(scrollNotification.metrics.pixels);
        }
        return true;
      },
      child: SingleChildScrollView(
        physics: isMapHover ? const NeverScrollableScrollPhysics() : null,
        controller: scrollController,
        child: Stack(
          children: [
            BackgroundWidget(
              width: widget.width,
              isMobile: true,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.width * 0.0445,
                    vertical: widget.width * 0.112,
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/TL_logo.svg',
                        width: widget.width * 0.91,
                      ),
                      SizedBox(height: widget.width * 0.1472),
                      TitleWidget(
                        width: widget.width,
                        isMobile: true,
                        onTap: () {
                          context.goNamed('report_category');
                        },
                      ),
                      MapScreen(
                        isMapHover: (isHover) {
                          setState(() {
                            isMapHover = isHover;
                          });
                        },
                        width: widget.width,
                        isMobile: true,
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //       horizontal: widget.width * 0.05,
                //       vertical: widget.width * 0.02),
                //   child: Column(
                //     children: [
                //       const Divider(
                //         height: 1,
                //         color: Color.fromRGBO(10, 51, 40, 0.1),
                //       ),
                //       SizedBox(height: widget.width * 0.0343),
                //       Footer(width: widget.width),
                //     ],
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
