import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '_typography.dart';

class TTextStyle {
  TTextStyle._();

  static TextStyle displayLarge() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.displayLarge,
        fontWeight: FontWeight.w900,
      );

  static TextStyle displayMedium() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.displayMedium,
        fontWeight: FontWeight.w800,
      );

  static TextStyle displaySmall() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.displaySmall,
        fontWeight: FontWeight.w700,
      );

  static TextStyle headlineLarge() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.headlineLarge,
        fontWeight: FontWeight.w600,
      );

  static TextStyle headlineMedium() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.headlineMedium,
        fontWeight: FontWeight.w500,
      );

  static TextStyle headlineSmall() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.headlineSmall,
        fontWeight: FontWeight.w400,
      );

  static TextStyle titleLarge() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.titleLarge,
        fontWeight: FontWeight.w600,
      );

  static TextStyle titleMedium() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.titleMedium,
        fontWeight: FontWeight.w500,
      );

  static TextStyle titleSmall() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.titleSmall,
        fontWeight: FontWeight.w400,
      );

  static TextStyle labelLarge() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.labelLarge,
        fontWeight: FontWeight.w400,
      );

  static TextStyle labelMedium() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.labelMedium,
        fontWeight: FontWeight.w400,
      );

  static TextStyle labelSmall() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.labelSmall,
        fontWeight: FontWeight.w400,
      );

  static TextStyle bodyLarge() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.bodyLarge,
        fontWeight: FontWeight.w400,
      );

  static TextStyle bodyMedium() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.bodyMedium,
        fontWeight: FontWeight.w400,
      );

  static TextStyle bodySmall() => GoogleFonts.alegreyaSans(
        fontSize: SystemFontsStyle.bodySmall,
        fontWeight: FontWeight.w400,
      );
}
