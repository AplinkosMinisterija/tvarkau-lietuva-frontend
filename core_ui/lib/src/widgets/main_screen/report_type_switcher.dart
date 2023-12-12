import 'package:core_ui/src/widgets/main_screen/report_type_switcher_button.dart';
import 'package:flutter/material.dart';

class ReportTypeSwitcher extends StatelessWidget {
  const ReportTypeSwitcher({
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
      width: width * 0.22,
      height: width * 0.0307,
      decoration: BoxDecoration(
        color: const Color(0xffeceaea),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(width * 0.002),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReportTypeSwitcherButton(
            width: (width * 0.22 / 2) - (width * 0.002 * 2),
            height: (width * 0.0307) - (width * 0.002 * 2),
            buttonText: 'Peržiūrėti pranešimus\napie šiukšles',
            isActive: isShowDumps ? false : true,
            onPressed: () {
              onReportTypeChange(false);
            },
          ),
          ReportTypeSwitcherButton(
            width: (width * 0.22 / 2) - (width * 0.002 * 2),
            height: (width * 0.0307) - (width * 0.002 * 2),
            buttonText: 'Peržiūrėti atliekų\nsurinkimo aikšteles',
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
