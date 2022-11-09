import 'package:etiya/src/config/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// It's a class that contains a static method that returns a ThemeData object
class AppTheme {
  AppTheme._();

  static ThemeData get theme => ThemeData(
        primarySwatch: AppColor.success,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );
}
