import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../common/custom_styles.dart';
import '../common/custom_colors.dart';

class AdminReportTypeSwitch extends StatelessWidget {
  const AdminReportTypeSwitch({
    super.key,
    required this.activeCategory,
    required this.onReportCategoryChange,
  });

  final String activeCategory;
  final ValueChanged<String> onReportCategoryChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _BuildButton(
            buttonText: 'Pranešimai apie atliekas',
            isActive: activeCategory == 'trash',
            onPressed: () {
              onReportCategoryChange('trash');
            },
          ),
          4.widthBox,
          _BuildButton(
            buttonText: 'Pranešimai apie miškus',
            isActive: activeCategory == 'forest',
            onPressed: () {
              onReportCategoryChange('forest');
            },
          ),
          4.widthBox,
          _BuildButton(
            buttonText: 'Atliekų surinkimo aikštelės',
            isActive: activeCategory == 'dump',
            onPressed: () {
              onReportCategoryChange('dump');
            },
          ),
          4.widthBox,
          _BuildButton(
            buttonText: 'Žievėgraužis tipografas',
            isActive: activeCategory == 'beetle',
            onPressed: () {
              onReportCategoryChange('beetle');
            },
          ),
        ],
      ),
    );
  }
}

class _BuildButton extends StatelessWidget {
  const _BuildButton({
    required this.buttonText,
    required this.isActive,
    required this.onPressed,
  });

  final String buttonText;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? CustomColors.orange : CustomColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Text(
              buttonText,
              style: CustomStyles.body2.copyWith(
                color: isActive ? CustomColors.white : CustomColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
