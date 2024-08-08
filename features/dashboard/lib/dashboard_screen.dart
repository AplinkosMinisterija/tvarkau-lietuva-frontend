library dashboard;

import 'package:dashboard/src/home/ui/home_screen.dart';
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
      color: const Color.fromRGBO(28, 63, 58, 1),
      child: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
