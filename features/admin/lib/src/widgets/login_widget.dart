import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required this.width,
    required this.onLogIn,
  });

  final double width;
  final VoidCallback onLogIn;

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
              SizedBox(
                height: width / 8,
              ),
              DepartmentLogoMobile(
                width: width,
                onTap: () {},
              ),
              SizedBox(
                height: width / 8,
              ),
              InkWell(
                onTap: onLogIn,
                onHover: (hover) {},
                hoverColor: Colors.blue,
                child: Container(
                  height: width * 0.05,
                  width: width * 0.25,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: width * 0.005),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(1, 117, 0, 1.0),
                      borderRadius: BorderRadius.circular(45),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/microsoft_logo.png',
                          height: width * 0.02,
                          width: width * 0.02,
                        ),
                        SizedBox(width: width * 0.01),
                        const Text(
                          'Prisijungti per AAD',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
