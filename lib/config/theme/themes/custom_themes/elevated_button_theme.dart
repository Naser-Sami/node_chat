import 'package:flutter/material.dart';
import '/config/_config.dart';

final darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: TextButton.styleFrom(
    elevation: 0,
    minimumSize: const Size(double.infinity, 54),
    overlayColor: DarkThemeColors.onPrimaryFixedVariant,
    backgroundColor: DarkThemeColors.primary,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.bR30),
    ),
    textStyle: TTextStyle.titleLarge(),
  ),
);

final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: TextButton.styleFrom(
    elevation: 0,
    minimumSize: const Size(double.infinity, 54),
    overlayColor: LightThemeColors.onPrimaryFixedVariant,
    backgroundColor: LightThemeColors.primary,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.bR30),
    ),
    textStyle: TTextStyle.titleLarge(),
  ),
);
