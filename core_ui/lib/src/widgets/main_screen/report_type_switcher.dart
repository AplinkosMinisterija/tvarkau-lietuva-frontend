import 'package:core_ui/src/widgets/main_screen/report_type_switcher_button.dart';
import 'package:flutter/material.dart';

class ReportTypeSwitcher extends StatelessWidget {
  const ReportTypeSwitcher({
    super.key,
    required this.isShowDumps,
    required this.onReportTypeChange,
  });

  final bool isShowDumps;
  final ValueChanged<bool> onReportTypeChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xffeceaea),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReportTypeSwitcherButton(
            width: 153,
            height: 42,
            buttonText: 'Peržiūrėti pranešimus\napie atliekas',
            isActive: isShowDumps ? false : true,
            onPressed: () {
              onReportTypeChange(false);
            },
          ),
          ReportTypeSwitcherButton(
            width: 153,
            height: 42,
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
