import 'package:flutter/material.dart';

class FontFamilyOutlet {
  static FontFamilyOutlet? _instance;

  FontFamilyOutlet._();
  static FontFamilyOutlet get instance {
    _instance ??= FontFamilyOutlet._();
    return _instance!;
  }

  String get fontName => 'Inter';

  TextStyle get textBlack => TextStyle(fontFamily: fontName, fontWeight: FontWeight.w900, fontSize: 24);
  TextStyle get textBold => TextStyle(fontFamily: fontName, fontWeight: FontWeight.w700, fontSize: 24);
  TextStyle get textExtraBold => TextStyle(fontFamily: fontName, fontWeight: FontWeight.w800, fontSize: 24);
  TextStyle get textExtraLight => TextStyle(fontFamily: fontName, fontWeight: FontWeight.w200, fontSize: 24);
  TextStyle get textLight => TextStyle(fontFamily: fontName, fontWeight: FontWeight.w300, fontSize: 24);
  TextStyle get textMedium => TextStyle(fontFamily: fontName, fontWeight: FontWeight.w500, fontSize: 24);
  TextStyle get textRegular => TextStyle(fontFamily: fontName, fontWeight: FontWeight.w400, fontSize: 24);
  TextStyle get textSemiBold => TextStyle(fontFamily: fontName, fontWeight: FontWeight.w600, fontSize: 24);
  TextStyle get textThin => TextStyle(fontFamily: fontName, fontWeight: FontWeight.w100, fontSize: 24);
}

extension FontFamilyExtension on BuildContext {
  FontFamilyOutlet get fontStyle => FontFamilyOutlet.instance;
}
