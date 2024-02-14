import 'package:core_ui/src/widgets/main_screen/mobile/report_type_switcher_button_mobile.dart';
import 'package:flutter/material.dart';

class ReportTypeSwitcherMobile extends StatelessWidget {
  const ReportTypeSwitcherMobile({
    super.key,
    required this.width,
    required this.isShowDumps,
    required this.onReportTypeChange,
  });

  final double width;
  final bool isShowDumps;
  final ValueChanged<bool> onReportTypeChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.866,
      height: width * 0.111,
      decoration: BoxDecoration(
        color: const Color(0xffeceaea),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.all(width * 0.011),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReportTypeSwitcherButtonMobile(
            width: width * 0.416,
            height: width * 0.0888,
            buttonText: 'Pranešimai apie atliekas',
            isActive: isShowDumps ? false : true,
            onPressed: () {
              onReportTypeChange(false);
            },
          ),
          ReportTypeSwitcherButtonMobile(
            width: width * 0.416,
            height: width * 0.0888,
            buttonText: 'Atliekų surinkimo aikštelės',
            isActive: isShowDumps ? true : false,
            onPressed: () {
              onReportTypeChange(true);
            },
          ),
        ],
      ),
    );
  }
}
