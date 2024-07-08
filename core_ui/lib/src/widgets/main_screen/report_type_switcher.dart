import 'package:core_ui/src/widgets/main_screen/report_type_switcher_button.dart';
import 'package:flutter/material.dart';

class ReportTypeSwitcher extends StatelessWidget {
  const ReportTypeSwitcher({
    super.key,
    required this.isShowDumps,
    required this.isMobile,
    required this.width,
    required this.onReportTypeChange,
  });

  final bool isShowDumps;
  final bool isMobile;
  final double width;
  final ValueChanged<String> onReportTypeChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? width * 0.8667 : width * 0.312,
      height: isMobile ? width * 0.111 : width * 0.04,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReportTypeSwitcherButton(
            width: width,
            isMobile: isMobile,
            buttonText: 'Pranešimai apie atliekas',
            isActive: isShowDumps ? false : true,
            onPressed: () {
              onReportTypeChange('trash');
            },
          ),
          ReportTypeSwitcherButton(
            width: width,
            isMobile: isMobile,
            buttonText: 'Atliekų surinkimo aikštelės',
            isActive: isShowDumps ? true : false,
            onPressed: () {
              onReportTypeChange('dumps');
            },
          ),
        ],
      ),
    );
  }
}
