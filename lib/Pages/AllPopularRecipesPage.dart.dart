import 'package:flutter/material.dart';
import 'package:foodcon/Components/MainPosters.dart';
import 'package:foodcon/Components/MyRecipe.dart';
import 'package:foodcon/Components/RoundedAppBar.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/MyChefProfilePage/MyChefProfilePage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:provider/provider.dart';

class AllPopularRecipesPage extends StatelessWidget {
  String id = "AllPopularRecipes";
  AllPopularRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(title: "اشهر الاكلات"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          padding: EdgeInsets.all(0),
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemCount: foodList.length,
          itemBuilder: (context, index) => MyRecipe(
            recipe: autoList[index],
            title: autoList[index].title,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipePage(
                    recipe: autoList[index],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
