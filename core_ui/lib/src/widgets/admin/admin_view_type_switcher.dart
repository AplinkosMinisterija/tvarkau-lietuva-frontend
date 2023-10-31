import 'package:core_ui/src/widgets/admin/admin_view_switcher_button.dart';
import 'package:core_ui/src/widgets/main_screen/report_type_switcher_button.dart';
import 'package:flutter/material.dart';

class AdminViewTypeSwitcher extends StatelessWidget {
  const AdminViewTypeSwitcher({
    required this.width,
    required this.activeView,
    required this.onViewTypeChange,
  });

  final double width;
  final String activeView;
  final ValueChanged<String> onViewTypeChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.09,
      height: width * 0.04,
      decoration: BoxDecoration(
        color: const Color(0xffeceaea),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(width * 0.002),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AdminViewSwitcherButton(
            width: width * 0.04,
            height: width * 0.04,
            type: 'chart',
            isActive: activeView == 'chart' ? true : false,
            onPressed: () {
              onViewTypeChange('chart');
            },
          ),
          AdminViewSwitcherButton(
            width: width * 0.04,
            height: width * 0.04,
            type: 'map',
            isActive: activeView == 'map' ? true : false,
            onPressed: () {
              onViewTypeChange('map');
            },
          ),
        ],
      ),
    );
  }
}
