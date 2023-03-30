import 'package:flutter/material.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Services/sharedPref.dart';

class FavoriteProv extends ChangeNotifier {
  List<RecipeModel> _favelistprov = [];
  List<RecipeModel> _SearchFavoritesList = [];
  ///////////////
  List<RecipeModel> get favelistprov => _favelistprov;
  List<RecipeModel> get searchFav => _SearchFavoritesList;
  /////////////
  set favelistprov(List<RecipeModel> val) {
    _favelistprov = val;
    notifyListeners();
  }

  getsavedDate() async {
    _favelistprov = await sharepref().getFavorites();
    print("#######asdasd##########");
    print(_favelistprov);
    notifyListeners();
    // return list;
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
}
