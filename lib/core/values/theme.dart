import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lift/core/values/colors.dart' as colors;

final ThemeData appTheme = ThemeData(
  primaryColor: colors.accentColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'NanumGothic',
  colorScheme: const ColorScheme.light().copyWith(
    primary: colors.accentColor,
    secondary: colors.accentLightColor,
    background: colors.accentColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.transparent,
  inputDecorationTheme: InputDecorationTheme(
      errorStyle: const TextStyle(fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
      )),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: Platform.isIOS ? 0 : 4.0,
    iconTheme: const IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    titleTextStyle: const TextStyle(color: Colors.grey, fontSize: 18),
  ),
);
