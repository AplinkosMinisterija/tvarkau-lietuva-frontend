import 'package:flutter/material.dart';
import './custom_department_logo.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';
import '../widgets/custom_button.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.name,
    required this.email,
    required this.onLogout,
  });

  final String name;
  final String email;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomDepartmentLogo(),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: CustomStyles.body1.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomColors.white,
                  ),
                ),
                Text(
                  email,
                  style: CustomStyles.body1.copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomColors.white.withOpacity(.53)),
                )
              ],
            ),
            20.widthBox,
            CustomButton(
                text: 'Atsijungti',
                width: 114,
                color: CustomColors.orange,
                onPressed: onLogout)
          ],
        ),
      ],
    );
  }
}
