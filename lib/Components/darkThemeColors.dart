import 'package:flutter/material.dart';
import 'package:foodcon/constants.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: isDarkTheme ? dark : light,
      primaryColor: isDarkTheme ? kDarkThemeColor : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? kDarkThemeColor : Color(0xffCBDCF8),
      hintColor: isDarkTheme ? kDarkThemeColor : Colors.grey,
      primaryColorLight: KprimaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: isDarkTheme ? kDarksecondThemeColor : KprimaryColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
        color: isDarkTheme ? kDarksecondThemeColor : KprimaryColor,
      )),
      hoverColor: isDarkTheme ? kDarksecondThemeColor : KprimaryColor,
      focusColor: isDarkTheme ? Color(0xff0B2512) : KprimaryColor,
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? kDarksecondThemeColor : KprimaryColor,
      canvasColor: isDarkTheme ? Color(0xFF121B22) : Color(0xffF1F5FB),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: isDarkTheme ? kDarksecondThemeColor : KprimaryColor),
      primaryColorDark: kDarksecondThemeColor,
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : Colors.grey),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateColor.resolveWith((states) {
          return isDarkTheme ? kDarksecondThemeColor : Colors.white;
        }),
        trackColor: MaterialStateColor.resolveWith((states) {
          return isDarkTheme ? kDarksecondThemeColor : Colors.grey;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return isDarkTheme ? kDarksecondThemeColor : KprimaryColor;
        }),
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelStyle: TextStyle(
          fontFamily: 'arabicmodern',
        ),
        labelColor: isDarkTheme ? kDarksecondThemeColor : KprimaryColor,
        indicatorColor: isDarkTheme ? kDarksecondThemeColor : KprimaryColor,
        labelStyle:
            TextStyle(fontFamily: 'arabicmodern', fontWeight: FontWeight.bold),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'arabicmodern',
        ),
        titleLarge:
            TextStyle(fontFamily: 'arabicmodern', fontWeight: FontWeight.bold),
        labelLarge:
            TextStyle(fontFamily: 'arabicmodern', fontWeight: FontWeight.bold),
        headlineLarge:
            TextStyle(fontFamily: 'arabicmodern', fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
          fontFamily: 'arabicmodern',
        ),
      ),
    );
  }
}

MaterialColor dark = MaterialColor(
  da,
  {
    50: Color.fromARGB(255, 34, 54, 70),
    100: Color.fromARGB(255, 150, 159, 167),
    200: Color.fromARGB(255, 150, 191, 223),
    300: Color.fromARGB(255, 54, 66, 75),
    400: Color.fromARGB(255, 69, 75, 80),
    500: Color.fromARGB(255, 132, 156, 173),
    600: Color.fromARGB(255, 35, 93, 138),
    700: Color.fromARGB(255, 91, 123, 148),
    800: Color.fromARGB(255, 114, 168, 209),
    900: Color.fromARGB(255, 77, 135, 179),
  },
);
const int da = 0xFF033F6C;

MaterialColor light = MaterialColor(
  li,
  {
    50: Color(0xFF4762FD),
    100: Color(0xFF4762FD),
    200: Color(0xFF4762FD),
    300: Color(0xFF4762FD),
    400: Color(0xFF4762FD),
    500: Color(0xFF4762FD),
    600: Color(0xFF4762FD),
    700: Color(0xFF4762FD),
    800: Color(0xFF4762FD),
    900: Color(0xFF4762FD),
  },
);
const int li = 0xFF4762FD;
