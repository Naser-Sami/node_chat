import 'package:flutter/material.dart';
import '/config/theme/_theme.dart';

ThemeData _lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightThemeColors.scaffoldBackground,
  colorScheme: colorSchemeLight,
  appBarTheme: lightAppBarTheme,
  textTheme: TTextTheme.lightTextTheme,
  primaryTextTheme: TTextTheme.lightTextTheme,
  extensions: lightExtensions,
  dividerTheme: lightDividerTheme,
  dividerColor: LightThemeColors.onBackground.withOpacity(0.25),
  textButtonTheme: lightTextButtonTheme,
  elevatedButtonTheme: lightElevatedButtonTheme,
);

ThemeData get lightTheme => _lightTheme;
