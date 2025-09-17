import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontUtils {
  static const String defaultCircularStd = 'Inter';
  static String? appPrimaryFont;
  static void updateFonts({String? primaryFont}) {
    appPrimaryFont = primaryFont;
  }
  static TextStyle FontStyle({
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14.0,
    Color color = Colors.black,
    double letterSpacing = 0.0,
     double height=0,
    TextDecoration decoration = TextDecoration.none,
  }) {
    if (appPrimaryFont != null && GoogleFonts.asMap().containsKey(appPrimaryFont)) {
      return GoogleFonts.getFont(
        appPrimaryFont!,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );
    }
    return TextStyle(
      fontFamily: defaultCircularStd,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }
}