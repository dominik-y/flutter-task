import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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

        // add color
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
