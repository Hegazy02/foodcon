import 'package:shared_preferences/shared_preferences.dart';

class DarkmoodSharedPref {
  static late SharedPreferences prefs;
  static setmood(bool val) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', val);
    print(val);
  }

  static Future<bool?> getmood() async {
    prefs = await SharedPreferences.getInstance();
    bool? mood = prefs.getBool('isDark');

    return mood;
  }
}
