import 'package:flutter/material.dart';
import 'package:llutterassigment/Utils/theme/theme_notifier.dart';

AppColor get colors => AppColor();

class AppColor extends ChangeNotifier {
  final ThemeNotifier appTheme = ThemeNotifier();
  ThemeData get _themeData => appTheme.lightTheme;
  ColorScheme get _colorScheme => _themeData.colorScheme;

  Color get purpleContainerColor => _colorScheme.primary;

  Color get whiteColor => _themeData.primaryColor;

  Color get blackTextColor => _colorScheme.inversePrimary;
}
 