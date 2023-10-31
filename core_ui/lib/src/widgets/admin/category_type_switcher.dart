import 'package:core_ui/src/widgets/main_screen/report_type_switcher_button.dart';
import 'package:flutter/material.dart';

class CategoryTypeSwitcher extends StatelessWidget {
  const CategoryTypeSwitcher({
    required this.width,
    required this.activeCategory,
    required this.onCategoryTypeChange,
  });

  final double width;
  final String activeCategory;
  final ValueChanged<String> onCategoryTypeChange;

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
            buttonText: 'Šiukšlių pranešimai',
            isActive: activeCategory == 'reports' ? true : false,
            onPressed: () {
              onCategoryTypeChange('reports');
            },
          ),
          ReportTypeSwitcherButton(
            width: (width * 0.22 / 2) - (width * 0.002 * 2),
            height: (width * 0.0307) - (width * 0.002 * 2),
            buttonText: 'Atliekų aikštelės',
            isActive: activeCategory == 'dumps' ? true : false,
            onPressed: () {
              onCategoryTypeChange('dumps');
            },
          ),
        ],
      ),
    );
  }
}
