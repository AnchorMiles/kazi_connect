import 'package:flutter/material.dart';

var primaryColor = const Color(0xFF136E11);
var onPrimaryColor = const Color(0xFFFFFFFF);
var primaryContainer = const Color(0xFF9EF88B);
var onPrimaryContainer = const Color(0xFF002201);

var secondaryColor = const Color(0xFF00677D);
var onSecondaryColor = const Color(0xFFFFFFFF);
var secondaryContainer = const Color(0xFFB4EBFF);
var onSecondaryContainer = const Color(0xFF001F27);

var tertiaryColor = const Color(0xFF795900);
var onTertiaryColor = const Color(0xFFFFFFFF);
var tertiaryContainer = const Color(0xFFFFDF9E);
var onTertiaryContainer = const Color(0xFF261A00);

var primaryColorDark = const Color(0xFF83DB72);
var onPrimaryColorDark = const Color(0xFF003A02);
var primaryContainerDark = const Color(0xFF005303);
var onPrimaryContainerDark = const Color(0xFF9EF88B);

var secondaryColorDark = const Color(0xFF5AD5F9);
var onSecondaryColorDark = const Color(0xFF003642);
var secondaryContainerDark = const Color(0xFF004E5F);
var onSecondaryContainerDark = const Color(0xFFB4EBFF);

var tertiaryColorDark = const Color(0xFFFBBD00);
var onTertiaryColorDark = const Color(0xFF402D00);
var tertiaryContainerDark = const Color(0xFF5B4300);
var onTertiaryContainerDark = const Color(0xFFFFDF9E);

var lightThemeData = ThemeData(
  primaryColor: primaryColor,
  useMaterial3: true,
  brightness: Brightness.light,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: primaryColor)),
  ),
);

var darkThemeData = ThemeData(
  primaryColor: primaryColorDark,
  useMaterial3: true,
  brightness: Brightness.dark,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: primaryColor)),
  ),
);
