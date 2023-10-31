library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

part 'app_icon.dart';

part 'app_colors.dart';

part 'app_icons_theme.dart';

part 'app_text_theme.dart';

class AppTheme {
  //Common colors
  static Color get transparentColor => AppColors.transparent;
  static Color get defaultTextColor => AppColors.black;

  static Color get mainThemeColor => AppColors.fiddleheadGreen;

  //System colors
  static Color get dropDownBorderColor => AppColors.titanWhite;
  static Color get dropDownTextColor => AppColors.gray;

  //Background colors
  static Color get lightBackgroundColor => Colors.white;
  static Color get bottomBarBackgroundColor => Colors.white;
  static Color get backgroundPrimaryColor => AppColors.mercury;
  static Color get backgroundReactionColor => AppColors.hawkesBlue;
  static Color get backgroundUserReactionColor => AppColors.powderBlue;

  //Cursor colors
  static Color get textFieldCursorColor => AppColors.royalBlue;
  static Color get gradientStartColor => AppColors.powderBlue;
  static Color get gradientEndColor => AppColors.blueMarguerite;

  //Text color
  static Color get buttonTextColor => AppColors.white;
  static Color get primaryTextColor => AppColors.mirage;
  static Color get textSecondaryColor => AppColors.royalBlue;
  static Color get descriptionTextPrimary => AppColors.mako;

  //System colors
  static Color get accentDividerColor => AppColors.titanWhite;

  //Button colors
  static Color get buttonBgColor => AppColors.royalBlue;
  static Color get buttonDarkBgColor => AppColors.black;
  static Color get inactiveButtonColor => AppColors.silverChalice;
  static Color get sliderButtonInnerColor => AppColors.purpleHeart;
  static Color get sliderButtonOuterColor => AppColors.coldPurple;
  static Color get dangerousButtonBgColor => AppColors.hotRed;

  //Gradient colors
  static const List<Color> dashboardGradient = <Color>[
    AppColors.hawkesBlue,
    AppColors.blueChalk,
  ];

  static const List<Color> userProfileGradient = <Color>[
    AppColors.titanWhite,
    AppColors.selago,
  ];
}
