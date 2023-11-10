import 'package:admin/src/updated_admin/ui/updated_admin_screen.dart';
import 'package:flutter/material.dart';
//import 'src/main/ui/main_admin_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UpdatedAdminScreen(),
      //MainAdminScreen(),
    );
  }
}
