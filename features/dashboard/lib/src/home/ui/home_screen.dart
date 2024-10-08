import 'package:core/core.dart';
import 'package:dashboard/src/home/ui/home_layout_mobile.dart';
import 'package:dashboard/src/home/ui/home_layout_web.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<double> getScrollOffset() async {
    double offset = await SecureStorageProvider().getScrollOffset();
    return offset;
  }

  @override
  void initState() {
    getScrollOffset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getScrollOffset(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return constraints.maxWidth > 900
                ? HomeLayoutWeb(
                    scrollOffset: snapshot.data!, width: constraints.maxWidth)
                : HomeLayoutMobile(
                    scrollOffset: snapshot.data!, width: constraints.maxWidth);
          });
        } else {
          return LoaderWidget().loader();
        }
      },
    );
  }
}
