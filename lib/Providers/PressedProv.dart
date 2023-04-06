import 'package:flutter/material.dart';

class PressedProv extends ChangeNotifier {
  String _follow = "متابعة";
  bool _switchHome = false;
  ///////////////

  String get follow => _follow;
  bool get switchHome => _switchHome;

  //////////////////

  changeFollow() {
    if (_follow == "متابعة") {
      _follow = "متابع";
    } else {
      _follow = "متابعة";
    }

    notifyListeners();
  }

  changeSwitch() {
    _switchHome = !_switchHome;
    notifyListeners();
  }
}
