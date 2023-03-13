import 'package:flutter/material.dart';

class FilterProv extends ChangeNotifier {
  List _page1FilteredList = [];
  List _page2FilteredList = [];
  List _favoritesList = [];
  List _SearchFavoritesList = [];
  int _isGridPressed = 1;
  int _isCatePressed = 0;
  int _fullScreenIndex = 0;

  List<dynamic> get fil1 => _page1FilteredList;
  List<dynamic> get fil2 => _page2FilteredList;
  List<dynamic> get fav => _favoritesList;
  List<dynamic> get searchFav => _SearchFavoritesList;
  int get isGird => _isGridPressed;
  int get isCate => _isCatePressed;
  int get ScreenIndex => _fullScreenIndex;
  set fil1(val) {
    _page1FilteredList = val;
    notifyListeners();
  }

  set fil2(val) {
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

  set addFav(val) {
    _favoritesList.add(val);
    _favoritesList = _favoritesList.toSet().toList();
    notifyListeners();
  }

  set removeFave(val) {
    _favoritesList.remove(val);
    _favoritesList = _favoritesList.toSet().toList();
    notifyListeners();
  }

  set searchFav(val) {
    _SearchFavoritesList = val;
    notifyListeners();
  }

  set removeSearchFave(val) {
    _SearchFavoritesList.remove(val);
    _SearchFavoritesList = _SearchFavoritesList.toSet().toList();
    notifyListeners();
  }
}
