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
    'stylehuntr': {
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
      'thirdtyColor': const Color(0xffe1c0a9),
      'activeColor': const Color(0xffd6732a),
      'compareColor': const Color(0xff8c685b),
    },
    'apprankr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xff7523bc),
      'activeColor': const Color(0xff16bbbb),
      'compareColor': const Color(0xff5e6373),
    },
    'hubpickr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xff00d9a5),
      'activeColor': const Color(0xffe6b70a),
      'compareColor': const Color(0xff747978),
    },
    'parentspotr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xff55a0c3),
      'activeColor': const Color(0xffe88eb0),
      'compareColor': const Color(0xffa0a0a0),
    },
    'sleepdeepr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xff684191),
      'activeColor': const Color(0xfff58a82),
      'compareColor': const Color(0xff4b5268),
    },
    'soundfindr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xffae1579),
      'activeColor': const Color(0xff0bbfc6),
      'compareColor': const Color(0xff5a6c78),
    },
    'yardpickr': {
      'primaryColor': const Color(0xFFffffff),
      'secondaryColor': const Color(0xFFf2f1f4),
      'thirdtyColor': const Color(0xffb89f5c),
      'activeColor': const Color(0xff929a47),
      'compareColor': const Color(0xffb6741b),
    }
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
