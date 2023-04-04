import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomSearchBar.dart';
import 'package:foodcon/Components/MyRecipe.dart';
import 'package:foodcon/Components/RoundedAppBar.dart';
import 'package:foodcon/Global/textStyle.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/chefProfileSearchProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class chefSearchPage extends StatelessWidget {
  const chefSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(
        title: "البحث",
      ),
      body: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Consumer<chefProfileSearchProv>(
            builder: (context, value, child) => CustomSearchBar(
              onChanged: (val) {
                print(val);
                value.searchList = autoList
                    .where((element) => element.title!.startsWith(val))
                    .toList();
                print(value.searchList);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<chefProfileSearchProv>(
                builder: (context, value, child) {
              List<RecipeModel> myList =
                  value.searchList.isEmpty ? autoList : value.searchList;

              return ListView.separated(
                  itemBuilder: (context, index) => MyRecipe(
                        recipe: myList[index],
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipePage(
                                recipe: myList[index],
                              ),
                            )),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 2.h,
                      ),
                  itemCount: myList.length);
            }),
          )
        ],
      ),
    );
  }
}
