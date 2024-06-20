import 'dart:typed_data';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import '../common/custom_colors.dart';
import '../common/custom_styles.dart';
import 'custom_button.dart';
import 'custom_dropdown.dart';

class AddAnswerTab extends StatelessWidget {
  const AddAnswerTab({
    super.key,
    required this.onStatusChange,
    required this.statusValue,
    required this.onAnswerChange,
    required this.answerValue,
    required this.onImageUpload,
    required this.onBackPress,
    required this.onSave,
  });

  final Function(int value) onStatusChange;
  final int statusValue;
  final Function(String value) onAnswerChange;
  final String answerValue;
  final Function(List<Uint8List>) onImageUpload;
  final VoidCallback onBackPress;
  final VoidCallback onSave;

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
          _BuildStatusSection(
            onStatusChange: (int value) {
              onStatusChange(value);
            },
            value: statusValue,
          ),
          14.heightBox,
          _BuildAnswerAndImageSection(
            onAnswerChange: (String value) {
              onAnswerChange(value);
            },
            answerValue: answerValue,
            onImageUpload: (uploadedOfficerImages) {
              onImageUpload(uploadedOfficerImages);
            },
          ),
          40.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                text: 'Atšaukti',
                buttonType: ButtonType.outlined,
                onPressed: () {
                  onBackPress();
                },
              ),
              16.widthBox,
              CustomButton(
                text: 'Išsaugoti',
                onPressed: () {
                  onSave();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildStatusSection extends StatelessWidget {
  const _BuildStatusSection({
    required this.onStatusChange,
    required this.value,
  });

  final Function(int value) onStatusChange;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Statusas',
          style: CustomStyles.body2,
        ),
        CustomDropdown(
          items: const [
            DropdownMenuItem(
              value: 0,
              alignment: Alignment.center,
              child: _BuildStatus(
                status: 'gautas',
              ),
            ),
            DropdownMenuItem(
              value: 1,
              alignment: Alignment.center,
              child: _BuildStatus(
                status: 'tiriamas',
              ),
            ),
            DropdownMenuItem(
              value: 2,
              alignment: Alignment.center,
              child: _BuildStatus(
                status: 'išspręsta',
              ),
            ),
            DropdownMenuItem(
              value: 3,
              alignment: Alignment.center,
              child: _BuildStatus(
                status: 'nepasitvirtino',
              ),
            ),
          ],
          onChanged: (value) {
            onStatusChange(value ?? 1);
          },
          value: value,
        ),
      ],
    );
  }
}

class _BuildStatus extends StatelessWidget {
  const _BuildStatus({required this.status});

  final String status;

  Color get color {
    return switch (status) {
      'gautas' => CustomColors.red,
      'tiriamas' => CustomColors.orange,
      'išspręsta' => CustomColors.green,
      'nepasitvirtino' => Colors.grey,
      _ => Colors.white,
    };
  }

  String get text {
    return switch (status) {
      'gautas' => 'Gauta',
      'tiriamas' => 'Tiriama',
      'išspręsta' => 'Išspręsta',
      'nepasitvirtino' => 'Nepasitvirtino',
      _ => '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: color,
        ),
      ),
      child: Text(
        text,
        style: CustomStyles.body2.copyWith(
          color: color,
        ),
      ),
    );
  }
}

class _BuildAnswerAndImageSection extends StatefulWidget {
  const _BuildAnswerAndImageSection({
    required this.onAnswerChange,
    required this.answerValue,
    required this.onImageUpload,
  });

  final Function(String value) onAnswerChange;
  final String answerValue;
  final Function(List<Uint8List> officerImages) onImageUpload;

  @override
  State<_BuildAnswerAndImageSection> createState() =>
      _BuildAnswerAndImageSectionState();
}

class _BuildAnswerAndImageSectionState
    extends State<_BuildAnswerAndImageSection> {
  List<Uint8List> _selectedImages = [];

  Future<void> getMultipleImageInfos() async {
    final images = await AppImagePicker().pickMultipleImages();

    setState(() {
      _selectedImages = (_selectedImages + images)
          .take(GlobalConstants.maxAllowedImageCount)
          .toList();
    });
  }

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
          child: TextFormField(
            initialValue: widget.answerValue,
            onChanged: (String value) {
              widget.onAnswerChange(value);
            },
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
        5.heightBox,
        _selectedImages.isNotEmpty
            ? ImageCollageMobile(
                width: 450,
                imageBytes: _selectedImages,
              )
            : const SizedBox.shrink(),
        5.heightBox,
        CustomButton(
          width: null,
          buttonType: ButtonType.outlined,
          text: _selectedImages.isNotEmpty
              ? 'Keisti nuotraukas'
              : 'Įkelti nuotraukas',
          onPressed: () async {
            await getMultipleImageInfos();
            widget.onImageUpload(_selectedImages);
          },
          icon: const Icon(
            Icons.upload,
            color: CustomColors.primary,
          ),
        ),
      ],
    );
  }
}
