import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const neutral1 = Color.fromRGBO(42, 45, 53, 1);
  static const neutral2 = Color.fromRGBO(90, 94, 86, 0.5);
  static const neutral3 = Color.fromRGBO(110, 119, 100, 0.8);
  static const neutral4 = Color.fromRGBO(169, 172, 174, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const florescentGreen = Color.fromRGBO(70, 228, 143, 1);
}

class AppTheme {
  static const SystemUiOverlayStyle systemUiOverlayLight = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle systemUiOverlayDark = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  );

  static final textTheme = GoogleFonts.poppinsTextTheme(
    TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        height: 27 / 18,
      ),
      displayMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 24 / 16,
      ),
      displaySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 21 / 14,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 21 / 14,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 21 / 14,
      ),
    ),
  );
}
