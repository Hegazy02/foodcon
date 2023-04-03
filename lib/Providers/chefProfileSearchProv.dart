import 'package:flutter/material.dart';
import 'package:foodcon/Models/RecipeModel.dart';

class chefProfileSearchProv extends ChangeNotifier {
  List<RecipeModel> _searchList = [];
  List<RecipeModel> get searchList => _searchList;
  set searchList(List<RecipeModel> val) {
    _searchList = val;
    notifyListeners();
  }
}
