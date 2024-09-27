import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ColorScheme lightColorScheme = ColorScheme.light(
      surface: Color(0xffFAFAFF), // lightest
      tertiary: Color(0xffEEF0F2), // 2nd lightest
      primary: Color(0xff000000), // 3rd
      secondary: Color(0xff252323), // 4th
      inversePrimary: Color(0xff70798c), // darkest
);

ThemeData lightMode = ThemeData(
      fontFamily: GoogleFonts.comfortaa().fontFamily, // does not work
      colorScheme: ColorScheme.light(
            surface: lightColorScheme.surface, // lightest
            tertiary: lightColorScheme.tertiary, // 2nd lightest
            primary: lightColorScheme.primary, // 3rd
            secondary: lightColorScheme.secondary, // 4th
            inversePrimary: lightColorScheme.inversePrimary, // darkest
      ),
      scaffoldBackgroundColor: lightColorScheme.surface,
      textTheme: Typography.material2021().black.copyWith(
            displayLarge: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            displayMedium: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            displaySmall: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            headlineLarge: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            headlineMedium: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            headlineSmall: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            titleLarge: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            titleMedium: TextStyle(
                  // fontSize: 36.fSize, //done // don't change
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            titleSmall: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            bodyLarge: TextStyle(
                  // fontSize: 18.fSize, // done // don't change
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            bodyMedium: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            bodySmall: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            labelLarge: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            labelMedium: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            labelSmall: TextStyle(
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
      ),
      appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(color: lightColorScheme.primary, fontSize: 24),
      ),
      inputDecorationTheme: InputDecorationTheme(
            errorStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
            ),
            errorMaxLines: 4,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(10),
            // normal state = enabledBorder
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                        color: lightColorScheme.secondary,
                        width: 2,
                  ),
            ),
            errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                        color: Colors.red,
                  ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
            ),
      ),
);