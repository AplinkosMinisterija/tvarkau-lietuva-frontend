import 'package:flutter/material.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';

class CustomDropdown extends StatelessWidget {
  // TODO(RIMAS): This is only a placeholder, implement it later
  const CustomDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: CustomColors.redMedium,
        border: Border.all(
          color: CustomColors.red,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Gautas',
              style: CustomStyles.body2.copyWith(
                color: CustomColors.red,
              ),
            ),
          ),
          4.widthBox,
          const Icon(
            Icons.expand_more_rounded,
            color: CustomColors.red,
            size: 20,
          ),
        ],
      ),
    );
  }
}
