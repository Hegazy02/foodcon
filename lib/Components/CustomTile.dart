import 'package:flutter/material.dart';
import 'package:foodcon/Global/textStyle.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';

class CustomTile extends StatelessWidget {
  RecipeModel recipe;
  Widget? subtitle;
  double? padding;
  Function()? onTap;

  CustomTile({required this.recipe, this.subtitle, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    DarkmoodProv darkmood = DarkmoodProv();
    Map item = categoriesList
        .firstWhere((element) => element['category'] == recipe.category);

    return ListTile(
      contentPadding: EdgeInsets.only(
        left: 10,
        top: 10,
      ),
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: mainthemeColor(darkmood),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          "${item['category']}",
          style: TextStyle(fontSize: 11, color: Colors.white),
        ),
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: Text("${recipe.title}", style: black12Bold),
      ),
      subtitle: Align(alignment: Alignment.centerRight, child: subtitle),
      trailing: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  recipe.image != "" ? recipe.image! : Klogo,
                ))),
      ),
      onTap: onTap,
    );
  }
}
