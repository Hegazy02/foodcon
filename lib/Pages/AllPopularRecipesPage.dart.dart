import 'package:flutter/material.dart';
import 'package:foodcon/Components/MainPosters.dart';
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
      appBar: AppBar(
        title: Row(
          children: [
            Text("أشهر الأكلات"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<FilterProv>(
          builder: (context, value, child) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: autoList.length,
              itemBuilder: (context, index) => MyRecipe(
                    index: index,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipePage(
                            recipe: autoList[index],
                          ),
                        )),
                  )),
        ),
      ),
    );
  }
}
