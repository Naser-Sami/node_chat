import 'package:flutter/material.dart';
import '/config/_config.dart';

final darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: TextButton.styleFrom(
    elevation: 0,
    minimumSize: const Size(double.infinity, 54),
    overlayColor: DarkThemeColors.onPrimaryFixedVariant,
    foregroundColor: DarkThemeColors.tertiary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.bR30),
    ),
    textStyle: TTextStyle.titleMedium().apply(
      color: DarkThemeColors.text,
    ),
  ),
);

final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: TextButton.styleFrom(
    elevation: 0,
    minimumSize: const Size(double.infinity, 54),
    overlayColor: LightThemeColors.onPrimaryFixedVariant,
    foregroundColor: LightThemeColors.tertiary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.bR30),
    ),
    textStyle: TTextStyle.titleMedium().apply(
      color: LightThemeColors.text,
    ),
  ),
);
