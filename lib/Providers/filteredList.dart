import 'package:flutter/material.dart';

class FilterProv extends ChangeNotifier {
  List page1FilteredList = [];
  List page2FilteredList = [];
  get fil1 => page1FilteredList;
  get fil2 => page2FilteredList;
  set fil1(val) {
    page1FilteredList = val;
    notifyListeners();
  }

  set fil2(val) {
    page2FilteredList = val;
    notifyListeners();
  }

  change(List l) {
    page1FilteredList = l;
    notifyListeners();
  }
}
