import 'package:flutter/material.dart';

class PressedProv extends ChangeNotifier {
  String _follow = "Follow";
  bool _switchHome = false;
  ///////////////

  String get follow => _follow;
  bool get switchHome => _switchHome;
  //////////////////

  changeFollow() {
    if (_follow == "Follow") {
      _follow = "Followed";
    } else {
      _follow = "Follow";
    }

    notifyListeners();
  }

  changeSwitch() {
    _switchHome = !_switchHome;
    notifyListeners();
  }
}
