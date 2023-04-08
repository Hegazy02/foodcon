import 'package:flutter/material.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';

const Color KprimaryColor = Color(0xFFF55744);
const kDarkThemeColor = Color(0xFF141C22);
const kDarksecondThemeColor = Color.fromARGB(255, 66, 100, 211);
const Klogo = "assets/images/Logo.png";

MaterialColor mainC = MaterialColor(
  mainColor,
  <int, Color>{
    50: Color(mainColor),
    100: Color(mainColor),
    200: Color(mainColor),
    300: Color(mainColor),
    400: Color(mainColor),
    500: Color(mainColor),
    600: Color(mainColor),
    700: Color(mainColor),
    800: Color(mainColor),
    900: Color(mainColor),
  },
);
int mainColor = 0xFFF55744;

Color mainthemeColor(darkmood) {
  Color mainthemeColor =
      darkmood.isDarkmood! ? kDarksecondThemeColor : KprimaryColor;
  return mainthemeColor;
}

Color fillFollowedColor(darkmood) {
  Color fillFollowedColor =
      darkmood.isDarkmood! ? kDarkThemeColor : Colors.white;
  return fillFollowedColor;
}
