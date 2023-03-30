import 'package:flutter/material.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Services/sharedPref.dart';

class FilterProv extends ChangeNotifier {
  List<RecipeModel> _page1FilteredList = [];
  List<RecipeModel> _page2FilteredList = [];
  List<RecipeModel> _favoritesList = [];
  List<RecipeModel> _SearchFavoritesList = [];
  int _isGridPressed = 1;
  int _isCatePressed = 0;
  int _fullScreenIndex = 0;
  String _follow = "Follow";
  bool _switchHome = false;

  List<RecipeModel> _favelistprov = [];

  lisen() {
    notifyListeners();
  }

  List<RecipeModel> get fil1 => _page1FilteredList;
  List<RecipeModel> get fil2 => _page2FilteredList;
  List<RecipeModel> get fav => _favoritesList;
  List<RecipeModel> get searchFav => _SearchFavoritesList;
  int get isGird => _isGridPressed;
  int get isCate => _isCatePressed;
  int get ScreenIndex => _fullScreenIndex;
  String get follow => _follow;
  bool get switchHome => _switchHome;
  List<RecipeModel> get favelistprov => _favelistprov;
  set fil1(List<RecipeModel> val) {
    _page1FilteredList = val;
    notifyListeners();
  }

  set fil2(List<RecipeModel> val) {
    _page2FilteredList = val;
    notifyListeners();
  }

  set isGird(val) {
    _isGridPressed = val;
    notifyListeners();
  }

  set isCate(val) {
    _isCatePressed = val;
    notifyListeners();
  }

  set ScreenIndex(val) {
    _fullScreenIndex = val;
    notifyListeners();
  }

  set fav(List<RecipeModel> val) {
    _favoritesList = val;
    notifyListeners();
  }

  set addFav(RecipeModel val) {
    _favoritesList.add(val);
    _favoritesList = _favoritesList.toSet().toList();
    notifyListeners();
  }

  set removeFave(RecipeModel val) {
    _favoritesList.remove(val);
    _favoritesList = _favoritesList.toSet().toList();
    notifyListeners();
  }

  set searchFav(List<RecipeModel> val) {
    _SearchFavoritesList = val;
    notifyListeners();
  }

  set removeSearchFave(RecipeModel val) {
    _SearchFavoritesList.remove(val);
    _SearchFavoritesList = _SearchFavoritesList.toSet().toList();
    notifyListeners();
  }

  set favelistprov(List<RecipeModel> val) {
    _favelistprov = val;
    notifyListeners();
  }

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

  getsavedDate() async {
    _favelistprov = await sharepref().getFavorites();
    print("#######asdasd##########");
    print(_favelistprov);
    notifyListeners();
    // return list;
  }

  refresh() {
    notifyListeners();
  }
}
