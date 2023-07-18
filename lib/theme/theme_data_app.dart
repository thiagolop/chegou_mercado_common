import 'package:flutter/material.dart';

import 'color_outlet.dart';

class ThemeDataApp {
  get lightTheme => ThemeData(
        primaryColor: ColorOutlet.primaryColor,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        colorScheme: const ColorScheme.light(
          onPrimary: ColorOutlet.primaryColor,
          surface: ColorOutlet.secondaryColor,
        ),
      );

  get darkTheme => ThemeData(
        primaryColor: ColorOutlet.primaryColor,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorOutlet.secondaryColor,
        colorScheme: const ColorScheme.dark(
          onPrimary: ColorOutlet.primaryColor,
          surface: ColorOutlet.secondaryColor,
        ),
      );
}
