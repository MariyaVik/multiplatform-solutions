import 'package:flutter/material.dart';

import 'color_palette.dart';

final colorfulTheme = ThemeData(
  listTileTheme:
      ListTileThemeData(selectedTileColor: Colorful.yellow.withOpacity(0.3)),
  colorScheme: const ColorScheme(
    primary: Colorful.blueDark,
    background: Colorful.white,
    brightness: Brightness.light,
    error: Colorful.errorColor,
    onBackground: Colorful.blueDark,
    onError: Colorful.white,
    onPrimary: Colorful.yellow,
    secondary: Colorful.pink,
    onSecondary: Colorful.white,
    surface: Colorful.white,
    onSurface: Colorful.yellow,
  ),
);
