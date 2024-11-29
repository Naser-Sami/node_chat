import 'package:flutter/material.dart';

import '/config/_config.dart';

AppBarTheme lightAppBarTheme = AppBarTheme(
  centerTitle: true,
  elevation: 0,
  scrolledUnderElevation: 0,
  toolbarHeight: 70,
  backgroundColor: LightThemeColors.scaffoldBackground,
  foregroundColor: LightThemeColors.onPrimaryContainer,
  titleTextStyle: TTextTheme.lightTextTheme.titleLarge,
);

AppBarTheme darkAppBarTheme = AppBarTheme(
  centerTitle: true,
  elevation: 0,
  scrolledUnderElevation: 0,
  toolbarHeight: 70,
  backgroundColor: DarkThemeColors.scaffoldBackground,
  foregroundColor: DarkThemeColors.onPrimaryContainer,
  titleTextStyle: TTextTheme.darkTextTheme.titleLarge,
);
