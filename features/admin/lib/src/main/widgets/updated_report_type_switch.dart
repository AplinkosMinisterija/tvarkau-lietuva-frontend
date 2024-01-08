import 'package:flutter/material.dart';
import '../common/extensions.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';

class UpdatedReportTypeSwitch extends StatelessWidget {
  const UpdatedReportTypeSwitch({
    super.key,
    required this.isShowDumps,
    required this.onReportTypeChange,
  });

  final bool isShowDumps;
  final ValueChanged<bool> onReportTypeChange;

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
            buttonText: 'Pranešimai apie šiukšles',
            isActive: isShowDumps ? false : true,
            onPressed: () {
              onReportTypeChange(false);
            },
          ),
          4.widthBox,
          _BuildButton(
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
