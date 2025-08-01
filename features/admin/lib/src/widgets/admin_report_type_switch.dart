import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../common/custom_styles.dart';
import '../common/custom_colors.dart';

class AdminReportTypeSwitch extends StatelessWidget {
  const AdminReportTypeSwitch({
    super.key,
    required this.width,
    required this.activeCategory,
    required this.onReportCategoryChange,
    required this.isEmailBoundToBeetle,
  });

  final double width;
  final String activeCategory;
  final ValueChanged<String> onReportCategoryChange;
  final bool isEmailBoundToBeetle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(4),
      width: width * 0.6,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: !isEmailBoundToBeetle
              ? [
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
                  4.widthBox,
                  _BuildButton(
                    buttonText: 'Nelegalūs kirtimai',
                    isActive: activeCategory == 'permits',
                    onPressed: () {
                      onReportCategoryChange('permits');
                    },
                  ),
                  4.widthBox,
                  _BuildButton(
                    buttonText: 'Kita',
                    isActive: activeCategory == 'misc',
                    onPressed: () {
                      onReportCategoryChange('misc');
                    },
                  ),
                ]
              : [
                  _BuildButton(
                    buttonText: 'Žievėgraužis tipografas',
                    isActive: activeCategory == 'beetle',
                    onPressed: () {
                      onReportCategoryChange('beetle');
                    },
                  ),
                ],
        ),
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
