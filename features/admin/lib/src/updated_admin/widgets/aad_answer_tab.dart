import 'package:flutter/material.dart';

import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import '../common/extensions.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dropdown.dart';

class AddAnswerTab extends StatelessWidget {
  const AddAnswerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
        color: CustomColors.grey,
      ),
      child: Column(
        children: [
          const _BuildStatusSection(),
          14.heightBox,
          const _BuildAnswerAndImageSection(),
          40.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                text: 'Atšaukti',
                buttonType: ButtonType.outlined,
                onPressed: () {},
              ),
              16.widthBox,
              CustomButton(
                text: 'Išsaugoti',
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BuildStatusSection extends StatelessWidget {
  const _BuildStatusSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Statusas',
          style: CustomStyles.body2,
        ),
        const CustomDropdown(),
      ],
    );
  }
}

class _BuildAnswerAndImageSection extends StatelessWidget {
  const _BuildAnswerAndImageSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Atsakymo tekstas',
          style: CustomStyles.body2,
        ),
        4.heightBox,
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: TextField(
            decoration: InputDecoration(
              hoverColor: CustomColors.primary.withOpacity(0.05),
              fillColor: CustomColors.white,
              filled: true,
              border: InputBorder.none,
            ),
            maxLines: 5,
          ),
        ),
        16.heightBox,
        Text(
          'Nuotraukos',
          style: CustomStyles.body2,
        ),
        4.heightBox,
        CustomButton(
          width: null,
          buttonType: ButtonType.outlined,
          text: 'Įkelkite nuotraukas',
          onPressed: () {},
          icon: const Icon(
            Icons.upload,
            color: CustomColors.primary,
          ),
        ),
      ],
    );
  }
}
