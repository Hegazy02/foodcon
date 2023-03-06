import 'package:flutter/material.dart';

class FilterProv extends ChangeNotifier {
  List filteredList = [];
  get fil => filteredList;
  set fil(val) {
    filteredList = val;
    notifyListeners();
  }

  change(List l) {
    filteredList = l;
    notifyListeners();
  }
}
