import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_colors.dart';

class CustomStyles {
  static TextStyle body1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: CustomColors.black,
  );
  static TextStyle body2 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CustomColors.black,
  );
  static TextStyle button1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: CustomColors.white,
  );
  static TextStyle button2 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: CustomColors.white,
  );

  static TextStyle h2 = GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: CustomColors.white,
  );
}
