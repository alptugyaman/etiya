import 'package:flutter/material.dart';

/*
  Material Color Online Generator
  http://mcg.mbitson.com/#!?mcgpalette0=%233f51b5
*/

/// This class is a Dart class that contains a bunch of static variables
/// that are used to store the
/// hex values of the colors used in the app
class AppColor {
  AppColor._();

  /// Primary Color Mapping
  static const MaterialColor primary = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFE5E6E6),
      100: Color(0xFFBFC0C1),
      200: Color(0xFF949798),
      300: Color(0xFF696D6F),
      400: Color(0xFF484D50),
      500: Color(_primaryColor),
      600: Color(0xFF24292C),
      700: Color(0xFF1E2325),
      800: Color(0xFF181D1F),
      900: Color(0xFF0F1213),
    },
  );
  static const int _primaryColor = 0xFF282E31;

  /// Secondary Color Mapping
  static const MaterialColor secondary = MaterialColor(
    _secondaryColor,
    <int, Color>{
      50: Color(0xFFE0F0FF),
      100: Color(0xFFB3D9FF),
      200: Color(0xFF80BFFF),
      300: Color(0xFF4DA5FF),
      400: Color(0xFF2692FF),
      500: Color(_secondaryColor),
      600: Color(0xFF0077FF),
      700: Color(0xFF006CFF),
      800: Color(0xFF0062FF),
      900: Color(0xFF004FFF),
    },
  );
  static const int _secondaryColor = 0xFF007FFF;

  /// Success Color Mapping
  static const MaterialColor success = MaterialColor(
    _successColor,
    <int, Color>{
      50: Color(0xFFEFF8ED),
      100: Color(0xFFD7EED2),
      200: Color(0xFFBDE3B4),
      300: Color(0xFFA3D796),
      400: Color(0xFF8FCF80),
      500: Color(_successColor),
      600: Color(0xFF73C061),
      700: Color(0xFF68B956),
      800: Color(0xFF5EB14C),
      900: Color(0xFF4BA43B),
    },
  );
  static const int _successColor = 0xFF7BC669;

  /// Danger Color Mapping
  static const MaterialColor danger = MaterialColor(
    _dangerColor,
    <int, Color>{
      50: Color(0xFFFFE0E0),
      100: Color(0xFFFFB3B3),
      200: Color(0xFFFF8080),
      300: Color(0xFFFF4D4D),
      400: Color(0xFFFF2626),
      500: Color(_dangerColor),
      600: Color(0xFFFF0000),
      700: Color(0xFFFF0000),
      800: Color(0xFFFF0000),
      900: Color(0xFFFF0000),
    },
  );
  static const int _dangerColor = 0xFFFF0000;

  /// Light Color Mapping
  static const MaterialColor light = MaterialColor(
    _lightColor,
    <int, Color>{
      50: Color(0xFFFEFEFE),
      100: Color(0xFFFDFDFD),
      200: Color(0xFFFCFCFC),
      300: Color(0xFFFAFAFA),
      400: Color(0xFFF9F9F9),
      500: Color(_lightColor),
      600: Color(0xFFF7F7F7),
      700: Color(0xFFF6F6F6),
      800: Color(0xFFF5F5F5),
      900: Color(0xFFF3F3F3),
    },
  );
  static const int _lightColor = 0xFFF8F8F8;

  /// Dark Color Mapping
  static const MaterialColor dark = MaterialColor(
    _darkColor,
    <int, Color>{
      50: Color(0xFFE5E6E6),
      100: Color(0xFFBFC0C1),
      200: Color(0xFF949798),
      300: Color(0xFF696D6F),
      400: Color(0xFF484D50),
      500: Color(_darkColor),
      600: Color(0xFF24292C),
      700: Color(0xFF1E2325),
      800: Color(0xFF181D1F),
      900: Color(0xFF0F1213),
    },
  );
  static const int _darkColor = 0xFF282E31;
}
