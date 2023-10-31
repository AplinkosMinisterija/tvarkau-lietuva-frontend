import 'package:flutter/material.dart';
import 'src/main/ui/main_admin_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MainAdminScreen());
  }
}
