import 'dart:convert';
import 'package:foodcon/Providers/favProv.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharepref {
  static late SharedPreferences prefs;
  RecipeModel? savedData;
  String? encodedData;
  instialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveFavorites({required RecipeModel item}) async {
    List<String>? mylist = await prefs.getStringList("mylist");
    if (mylist == null) {
      mylist = [];
    }
    Map myMap = {
      "title": item.title,
      "image": item.image,
      "category": item.category,
      "chefName": item.chefName,
      "chefAvatar": item.chefAvatar,
      "desc": item.desc,
      "posted": item.posted
    };
    print("******my map ***************");
    print(myMap);
    encodedData = jsonEncode(myMap);
    mylist.add(encodedData!);
    await prefs.setStringList("mylist", mylist);
  }

  Future<List<RecipeModel>> getFavorites() async {
    List<RecipeModel> list = [];
    List<String>? getlist;
    getlist = await prefs.getStringList("mylist");
    print(getlist);
    if (getlist != null) {
      list = await decodeList(getlist);
    }
    return list;
  }

  decodeList(List<String> getlist) async {
    List<RecipeModel> list = [];
    for (int i = 0; i < getlist.length; i++) {
      RecipeModel decodedData =
          await RecipeModel.fromJson(jsonDecode(getlist[i]));
      list.add(decodedData);
    }
    return list;
  }

  deleteFave({required RecipeModel? item, required context}) async {
    List<String>? mylist = await prefs.getStringList("mylist");
    if (mylist == null) {
      mylist = [];
    }

    var myprov = Provider.of<FavoriteProv>(context, listen: false);
    List<RecipeModel> newlist = await decodeList(mylist);

    newlist.forEach((element) {
      print("*********** new list *****************");
      print(element.posted);
    });

    deleteItem(newlist, item, mylist);
    myprov.favelistprov = newlist;
    prefs.setStringList("mylist", mylist);
  }

  void deleteItem(
      List<RecipeModel> newlist, RecipeModel? item, List<String> mylist) {
    for (var i = 0; i < newlist.length; i++) {
      if (newlist[i].title == item!.title &&
          newlist[i].desc == item.desc &&
          newlist[i].image == item.image &&
          newlist[i].posted == item.posted &&
          newlist[i].chefAvatar == item.chefAvatar &&
          newlist[i].chefName == item.chefName) {
        newlist.removeAt(i);
        mylist.removeAt(i);
        print("****************item deleted***********");
        break;
      }
    }
  }

  deleteAll() async {
    await prefs.remove("mylist");
  }
}
