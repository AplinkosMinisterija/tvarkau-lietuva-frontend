import 'dart:typed_data';
import 'package:core/constants/global_constants.dart';
import 'package:core/utils/image_display/image_display.dart';
import 'package:core/utils/url_launcher.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class AddingScreenSideBar extends StatelessWidget {
  const AddingScreenSideBar({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.category,
    required this.onExitTap,
    required this.onImageAddTap,
    required this.onFinalTap,
    required this.onImageRemoveTap,
    required this.onExplanationTap,
    required this.onTextChange,
    required this.onEmailChange,
    required this.selectedImages,
    required this.onTermsChange,
    required this.onEmailsEnabledChange,
    required this.isImagesSizeValid,
    required this.isTermsAccepted,
    required this.isEmailsEnabled,
  });

  final double width;
  final double height;
  final String title;
  final String category;
  final VoidCallback onFinalTap;
  final VoidCallback onExitTap;
  final VoidCallback onImageAddTap;
  final VoidCallback onExplanationTap;
  final Function(int) onImageRemoveTap;
  final Function(String) onTextChange;
  final Function(String) onEmailChange;
  final Function(bool) onTermsChange;
  final Function(bool) onEmailsEnabledChange;
  final List<Uint8List> selectedImages;
  final bool isImagesSizeValid;
  final bool isTermsAccepted;
  final bool? isEmailsEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width * 0.31875,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.03125),
          child: Column(
            children: [
              ExitHeader(
                  title: title,
                  width: width,
                  onTap: () {
                    onExitTap();
                  }),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: onExplanationTap,
                  onHover: (isHover) {},
                  child: Text(
                    'Kaip naudotis?',
                    style: GoogleFonts.roboto(
                      decoration: TextDecoration.underline,
                      fontSize: width * 0.01093,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 199, 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.0125,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pranešimo turinys',
                  style: GoogleFonts.roboto(
                    fontSize: width * 0.01093,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              SizedBox(height: width * 0.00468),
              Container(
                height: width * 0.09375,
                padding: EdgeInsets.all(
                  width * 0.01,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: TextFormField(
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Prašome įvesti pranešimo turinį';
                    }
                    return null;
                  },
                  onChanged: (textValue) {
                    onTextChange(textValue);
                  },
                  style: GoogleFonts.roboto(
                      fontSize: width * 0.0125,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.0125,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jūsų el. pašto adresas',
                  style: GoogleFonts.roboto(
                    fontSize: width * 0.01093,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              SizedBox(height: width * 0.00468),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: width * 0.03125,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  Container(
                    height: width * 0.03125,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                    ),
                    child: TextFormField(
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.top,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Prašome įvesti el. pašto adresą';
                        } else if (RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return 'Prašome įvesti teisingą el. pašto adresą';
                        }
                      },
                      onChanged: (emailValue) {
                        onEmailChange(emailValue);
                      },
                      style: GoogleFonts.roboto(
                          fontSize: width * 0.0125,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: width * 0.0125),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Įkelkite bent 2 pažeidimo nuotraukas',
                  style: GoogleFonts.roboto(
                    fontSize: width * 0.01093,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.007,
              ),
              ImageAddButton(
                width: width,
                title: selectedImages.isNotEmpty
                    ? 'Įkelti kitas nuotraukas'
                    : 'Įkelti nuotraukas',
                onTap: () {
                  onImageAddTap();
                },
                isMobile: false,
              ),
              SizedBox(
                height: width * 0.007,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Maksimalus nuotraukų kiekis: ${GlobalConstants.maxAllowedImageCount}',
                  style: GoogleFonts.roboto(
                    fontSize: width * 0.009375,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.02,
                child: TextFormField(
                  enabled: true,
                  maxLines: 1,
                  readOnly: true,
                  initialValue: " ",
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  textAlignVertical: TextAlignVertical.top,
                  validator: (value) {
                    if (selectedImages.isEmpty) {
                      return 'Prašome įkelti bent 2 nuotraukas';
                    } else {
                      if (selectedImages.length < 2) {
                        return 'Prašome įkelti bent 2 nuotraukas';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
              ),
              SizedBox(
                height: width * 0.007,
              ),
              selectedImages.isNotEmpty
                  ? SizedBox(
                      width: width / 2.4 * 0.9111,
                      height: selectedImages.length > 2
                          ? width / 2.4 * 0.7111
                          : width / 2.4 * 0.3555,
                      child: AlignedGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ImageGallery().buildPickerImage(
                              image: selectedImages[index],
                              context: context,
                              width: width,
                              onRemoveTap: () {
                                onImageRemoveTap(index);
                              });
                        },
                        itemCount: selectedImages.length,
                      ),
                    )
                  : const SizedBox.shrink(),
              !isImagesSizeValid
                  ? Text(
                      'Maksimalus nuotraukų dydis 20 MB',
                      style: TextStyle(
                        color: const Color(0xFFe53935),
                        fontSize: width * 0.01,
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(height: width * 0.01),
              CheckboxListTile(
                activeColor: const Color.fromRGBO(57, 97, 84, 1),
                title: RichText(
                  text: TextSpan(
                      text: 'Sutinku su departamento ',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.0104,
                      ),
                      children: [
                        TextSpan(
                          text: 'asmens duomenų apsaugos tvarkymo taisyklėmis',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.0104,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => LaunchUrl().launch(
                                'https://aad.lrv.lt/lt/asmens-duomenu-apsauga/'),
                        )
                      ]),
                ),
                value: isTermsAccepted,
                onChanged: (value) {
                  onTermsChange(value!);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (isEmailsEnabled != null) ...[
                CheckboxListTile(
                  activeColor: const Color.fromRGBO(57, 97, 84, 1),
                  title: Text(
                    'Gauti atnaujinimus el. paštu',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.0104,
                    ),
                  ),
                  value: isEmailsEnabled,
                  onChanged: (value) {
                    onEmailsEnabledChange(value!);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                )
              ],
              SizedBox(
                height: width * 0.02,
                child: TextFormField(
                  enabled: true,
                  maxLines: 1,
                  readOnly: true,
                  initialValue: " ",
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  textAlignVertical: TextAlignVertical.top,
                  validator: (value) {
                    if (!isTermsAccepted) {
                      return 'Privaloma sutikti';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: width * 0.01,
              ),
              MarkButtonMobile(
                isActive: true,
                width: width / 3.5,
                onTap: () {
                  onFinalTap();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
