import 'package:flutter/material.dart';
import './custom_department_logo.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';
import '../widgets/custom_button.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.heightBox,
            const CustomDepartmentLogo(),
            20.heightBox,
            Text(
              'Atlikta!',
              style: CustomStyles.body1.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomColors.white,
              ),
            ),
            20.heightBox,
            CustomButton(
                text: 'Grįžti į admnistracinę konsolę',
                width: 350,
                color: CustomColors.orange,
                onPressed: onContinue),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
