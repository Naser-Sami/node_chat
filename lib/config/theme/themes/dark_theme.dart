import 'package:flutter/material.dart';
import '/config/theme/_theme.dart';

ThemeData _darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkThemeColors.scaffoldBackground,
  colorScheme: colorSchemeDark,
  appBarTheme: darkAppBarTheme,
  textTheme: TTextTheme.darkTextTheme,
  primaryTextTheme: TTextTheme.darkTextTheme,
  extensions: darkExtensions,
  dividerTheme: darkDividerTheme,
  dividerColor: DarkThemeColors.onBackground.withOpacity(0.25),
  textButtonTheme: darkTextButtonTheme,
  elevatedButtonTheme: darkElevatedButtonTheme,
);

ThemeData get darkTheme => _darkTheme;
