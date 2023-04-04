import 'package:flutter/material.dart';

class DarkmoodProv extends ChangeNotifier {
  static bool _isDarkmood = false;
  bool get isDarkmood => _isDarkmood;

  set isDarkmood(bool val) {
    _isDarkmood = val;
    notifyListeners();
  }
}
