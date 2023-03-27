import 'package:shared_preferences/shared_preferences.dart';

class sharepref {
  static late SharedPreferences prefs;
  int? counter;
  instialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveFavorites(var value, index) async {
    counter = prefs.getInt('counter');

    if (counter == null || counter == 0) {
      print("counter is null ya 3mmmm");
      await prefs.setInt('counter', 1);
      counter = 1;
      await prefs.setString('favRecipeTitle1', value.fil2[index]['title']);
      await prefs.setString(
          'favRecipeCategory1', value.fil2[index]['category']);
      await prefs.setString('favRecipeImage1', value.fil2[index]['image']);
      await prefs.setString(
          'favRecipeChefName1', value.fil2[index]['chefName']);
      await prefs.setString(
          'favRecipeChefAvatar1', value.fil2[index]['chefAvatar']);
      await prefs.setDouble('favRecipeStar1', value.fil2[index]['star']);
      await prefs.setInt('favRecipeMin1', value.fil2[index]['min']);
      await prefs.setString('favRecipeDesc1', value.fil2[index]['desc']);
    } else {
      counter = counter! + 1;
      await prefs.setInt('counter', counter!);
      await prefs.setString(
          'favRecipeTitle$counter', value.fil2[index]['title']);
      await prefs.setString(
          'favRecipeCategory$counter', value.fil2[index]['category']);
      await prefs.setString(
          'favRecipeImage$counter', value.fil2[index]['image']);
      await prefs.setString(
          'favRecipeChefName$counter', value.fil2[index]['chefName']);
      await prefs.setString(
          'favRecipeChefAvatar$counter', value.fil2[index]['chefAvatar']);
      await prefs.setDouble('favRecipeStar$counter', value.fil2[index]['star']);
      await prefs.setInt('favRecipeMin$counter', value.fil2[index]['min']);
      await prefs.setString('favRecipeDesc$counter', value.fil2[index]['desc']);
    }
    print(
        "favRecipeTitle${counter}####### ${prefs.getString('favRecipeTitle${counter}')}");
    value.fil2[index]['isLiked'] = !value.fil2[index]['isLiked'];
    if (value.fil2[index]['isLiked'] == true) {
      value.addFav = value.fil2[index];
    } else {
      value.removeFave = value.fil2[index];
    }
    print("** ${value.fil2[index]['isLiked']}");
    print("#### success save");
  }

  getFavorites(List list) async {
    counter = prefs.getInt('counter');
    print("counter $counter");
    if (counter != null) {
      print("****get counter $counter");
      for (int i = 1; i <= counter!; i++) {
        final String? title = prefs.getString('favRecipeTitle$i');
        final String? category = prefs.getString('favRecipeCategory$i');
        final String? image = prefs.getString('favRecipeImage$i');
        final String? chefName = prefs.getString('favRecipeChefName$i');
        final String? chefAvatar = prefs.getString('favRecipeChefAvatar$i');
        final double? Star = prefs.getDouble('favRecipeStar$i');
        final int? min = prefs.getInt('favRecipeMin$i');
        final String? des = prefs.getString('favRecipeDesc$i');
        list.add({
          "title": title,
          "category": category,
          "image": image,
          "chefName": chefName,
          "chefAvatar": chefAvatar,
          "Star": Star,
          "min": min,
          "des": des,
        });
      }
    }
  }

  deleteFave(i, {List? list}) {
    print("deleteFave list ${list}");
    counter = prefs.getInt('counter');
    prefs.remove('favRecipeTitle$i');
    prefs.remove('favRecipeCategory$i');
    prefs.remove('favRecipeImage$i');
    prefs.remove('favRecipeChefName$i');
    prefs.remove('favRecipeChefAvatar$i');
    prefs.remove('favRecipeStar$i');
    prefs.remove('favRecipeMin$i');
    prefs.remove('favRecipeDesc$i');
    prefs.setInt('counter', counter! - 1);
    print("Counter $counter");
    print("deleteFave i ${i}");
    var s = list!.removeAt(i - 1);
    print("ssssssssss########### $s");
  }

  removeCounter() {
    prefs.remove('counter');
  }
}
