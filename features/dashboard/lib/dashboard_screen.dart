library dashboard;

import 'package:dashboard/src/home/ui/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
export 'package:dashboard/dashboard_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Tvarkau Lietuvą",
      color: Colors.green,
      child: const Scaffold(
        body: CupertinoPageScaffold(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
