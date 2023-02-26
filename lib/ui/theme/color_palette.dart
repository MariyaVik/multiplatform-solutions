import 'package:flutter/material.dart';

abstract class Colorful {
  static const Color pink = Color(0xFFF78A8F);
  static const Color white = Color(0xFFF3F7FA);
  static const Color yellow = Color(0xFFFFD802);
  static const Color blueLight = Color(0xFF024D8C);
  static const Color blueDark = Color(0xFF002357);
  static const Color errorColor = Color(0xFF790000);
  static List<Color> get colors => [pink, white, yellow, blueLight, blueDark];
}
