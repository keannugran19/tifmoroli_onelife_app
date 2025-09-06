import 'package:flutter/material.dart';

const textColor = Color(0xFF000000);
const backgroundColor = Color(0xFFffffff);
const primaryColor = Color(0xFFE5B80B);
const primaryFgColor = Color(0xFF000000);
const secondaryColor = Color(0xFF1f1fa8);
const secondaryFgColor = Color(0xFFffffff);
const accentColor = Color(0xFF61ff61);
const accentFgColor = Color(0xFF000000);

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
