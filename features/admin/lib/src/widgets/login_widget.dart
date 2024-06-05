import 'package:admin/src/widgets/login_button.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required this.width,
    required this.onLogIn,
  });

  final double width;
  final Function(String) onLogIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: width,
            height: width / 2,
            color: const Color.fromRGBO(57, 97, 84, 1),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: width / 20),
              DepartmentLogoMobile(
                width: width,
                onTap: () {},
              ),
              SizedBox(height: width / 20),
              LoginButton(
                  width: width, scale: 1, onLogIn: onLogIn, tenant: 'aad'),
              SizedBox(height: width / 20),
              LoginButton(
                  width: width, scale: 0.8, onLogIn: onLogIn, tenant: 'amvmt'),
            ],
          )
        ],
      ),
    );
  }
}
