import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../gen/colors.gen.dart';

class Themes {
  ThemeData selectLightTheme() {
    final Map<int, Color> color = {
      50: ColorName.primaryColor.withOpacity(0.1),
      100: ColorName.primaryColor.withOpacity(.2),
      200: ColorName.primaryColor.withOpacity(.3),
      300: ColorName.primaryColor.withOpacity(.4),
      400: ColorName.primaryColor.withOpacity(.5),
      500: ColorName.primaryColor.withOpacity(.6),
      600: ColorName.primaryColor.withOpacity(.7),
      700: ColorName.primaryColor.withOpacity(.8),
      800: ColorName.primaryColor.withOpacity(.9),
      900: ColorName.primaryColor.withOpacity(1),
    };

    return ThemeData(
      useMaterial3: false,
      fontFamily: 'Inter', // Set Inter as the global default font
      splashColor: ColorName.primaryColor.withOpacity(0.2),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorName.primaryColor,
      appBarTheme: selectAppBarTheme(),
      primarySwatch: MaterialColor(ColorName.primaryColor.value, color),
      textTheme: selectTextTheme(),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.white,
        shape: RoundedRectangleBorder(),
      ),
      elevatedButtonTheme: elevatedButtonTheme(),
      outlinedButtonTheme: outLinedButtonTheme(),
      dividerTheme: DividerThemeData(
        color: Colors.grey.withAlpha(500),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        tileColor: Colors.white,
      ),
    );
  }

  TextTheme selectTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
    );
  }

  AppBarTheme selectAppBarTheme() {
    return const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorName.primaryColor,
        fontFamily: "Inter", // Default Inter
      ),
    );
  }

  ElevatedButtonThemeData elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        disabledForegroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey,
        backgroundColor: ColorName.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }

  OutlinedButtonThemeData outLinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter', // Default Inter
        ),
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(color: ColorName.primaryColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      focusColor: ColorName.primaryColor,
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter', // Default Inter
      ),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter', // Default Inter
      ),
      fillColor: Colors.white,
      filled: true,
    );
  }
}
