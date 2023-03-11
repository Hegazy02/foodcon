import 'package:flutter/material.dart';

class FilterProv extends ChangeNotifier {
  List page1FilteredList = [];
  List page2FilteredList = [];
  int isGridPressed = 1;
  int isCatePressed = 0;
  int fullScreenIndex = 0;

  List<dynamic> get fil1 => page1FilteredList;
  List<dynamic> get fil2 => page2FilteredList;
  int get isGird => isGridPressed;
  int get isCate => isCatePressed;
  int get ScreenIndex => fullScreenIndex;
  set fil1(val) {
    page1FilteredList = val;
    notifyListeners();
  }

  set fil2(val) {
    page2FilteredList = val;
    notifyListeners();
  }

  set isGird(val) {
    isGridPressed = val;
    notifyListeners();
  }

  set isCate(val) {
    isCatePressed = val;
    notifyListeners();
  }

  set ScreenIndex(val) {
    fullScreenIndex = val;
    notifyListeners();
  }
}
