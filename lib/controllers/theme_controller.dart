import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shared/theme.dart';

class ThemeController extends GetxController {
  var currentTheme = 'techspotr'.obs;

  // Theme configurations for different apps
  Map<String, Map<String, dynamic>> themes = {
    'techspotr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xFF0284c7),
      'activeColor': const Color(0xFF84cc16),
      'compareColor': const Color(0xfff59e0b),
    },
    'gadgetspotr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xFF2563eb),
      'activeColor': const Color(0xFF10a4ea),
      'compareColor': const Color(0xffd946ef),
    },
    'stylehunter': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xffc026d3),
      'activeColor': const Color(0xff88c621),
      'compareColor': const Color(0xff0ea5e9),
    },
    'autologr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xffd12d26),
      'activeColor': const Color(0xfffe9402),
      'compareColor': const Color(0xff71717a),
    },
    'petspotr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xffffd900),
      'activeColor': const Color(0xff0ea5e9),
      'compareColor': const Color(0xfff97316),
    },
    'apprankr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xff7523bc),
      'activeColor': const Color(0xff10c3b8),
      'compareColor': const Color(0xff5e6373),
    },
  };

  void setTheme(String themeName) {
    if (themes.containsKey(themeName)) {
      currentTheme.value = themeName;
      _updateGlobalTheme();
    }
  }

  void _updateGlobalTheme() {
    final theme = themes[currentTheme.value]!;
    primaryColor = theme['primaryColor'];
    secondaryColor = theme['secondaryColor'];
    thirdtyColor = theme['thirdtyColor'];
    activeColor = theme['activeColor'];
    compareColor = theme['compareColor'];
  }

  Color get currentPrimaryColor => themes[currentTheme.value]!['primaryColor'];
  Color get currentSecondaryColor =>
      themes[currentTheme.value]!['secondaryColor'];
  Color get currentThirdtyColor => themes[currentTheme.value]!['thirdtyColor'];
  Color get currentActiveColor => themes[currentTheme.value]!['activeColor'];
  Color get currentCompareColor => themes[currentTheme.value]!['compareColor'];
}
