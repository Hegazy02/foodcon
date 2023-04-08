import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/CategoryIcons.dart';
import 'package:foodcon/Components/CustomExplore.dart';
import 'package:foodcon/Components/CustomSearchBar.dart';
import 'package:foodcon/Components/CustomTile.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Providers/PressedProv.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../Components/chefListTile.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String id = "searchPage";

  String? searchVal;
  String? searchChef;
  @override
  Widget build(BuildContext context) {
    DarkmoodProv darkmood = DarkmoodProv();
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 3.h,
          ),
          TabBar(indicatorColor: mainthemeColor(darkmood), tabs: [
            Tab(
              child: Text("الشيفات"),
            ),
            Tab(
              child: Text("الوصفات"),
            ),
          ]),
          Expanded(
            child: TabBarView(children: [
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Consumer<FilterProv>(
                      builder: (context, valprov, child) {
                        return CustomSearchBar(
                          top: 10,
                          onChanged: (value) {
                            searchChef = value;
                            valprov.chefFilteredList =
                                autoList.where((element) {
                              return element.chefName
                                  .toString()
                                  .toLowerCase()
                                  .startsWith(
                                      searchChef.toString().toLowerCase());
                            }).toList();
                            valprov.chefFilteredList = searchChef!.isEmpty
                                ? []
                                : valprov.chefFilteredList;
                            print(searchChef);
                            print("********${valprov.chefFilteredList}");
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Consumer<FilterProv>(
                      builder: (context, value, child) {
                        List<RecipeModel> chefList =
                            value.chefFilteredList.isEmpty
                                ? autoList
                                : value.chefFilteredList;
                        return Expanded(
                          child: AnimationLimiter(
                            child: ListView.builder(
                              itemCount: chefList.length,
                              padding: EdgeInsets.all(0),
                              itemBuilder: (context, index) {
                                print(chefList);
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                        child: ChefListTile(
                                            myrecipe: chefList[index])),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Consumer<FilterProv>(
                      builder: (context, valprov, child) {
                        return CustomSearchBar(
                          top: 10,
                          onChanged: (value) {
                            searchVal = value;
                            valprov.fil2 = autoList.where((element) {
                              return element.title
                                  .toString()
                                  .startsWith(searchVal.toString());
                            }).toList();
                            valprov.fil2 =
                                searchVal!.isEmpty ? [] : valprov.fil2;
                            print("********${valprov.fil2}");
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CategoryIcons(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 45,
                        width: 80,
                        child: Consumer<FilterProv>(
                            builder: (context, value, child) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => value.isGird = 0,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height: 45,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: value.isGird == 0
                                            ? mainthemeColor(darkmood)
                                            : Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.grid_view,
                                        color: value.isGird == 0
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => value.isGird = 1,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height: 45,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: value.isGird == 1
                                            ? mainthemeColor(darkmood)
                                            : Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.list,
                                        color: value.isGird == 1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        }),
                      ),
                    ),
                    Consumer<FilterProv>(
                      builder: (context, value, child) {
                        List<RecipeModel> l =
                            value.fil2.isEmpty ? autoList : value.fil2;
                        return value.isGird == 1
                            ? Expanded(
                                child: AnimationLimiter(
                                  child: ListView.builder(
                                    itemCount: l.length,
                                    padding: EdgeInsets.all(0),
                                    itemBuilder: (context, index) {
                                      print(l);
                                      return AnimationConfiguration
                                          .staggeredList(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 375),
                                        child: SlideAnimation(
                                          verticalOffset: 50.0,
                                          child: FadeInAnimation(
                                            child: CustomTile(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          RecipePage(
                                                        recipe: l[index],
                                                      ),
                                                    ));
                                              },
                                              recipe: l[index],
                                              subtitle: SizedBox(
                                                width: 60,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text("${l[index].star}"),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Expanded(
                                child: AnimationLimiter(
                                  child: GridView.count(
                                      padding: EdgeInsets.only(top: 5),
                                      crossAxisCount: 2,
                                      children:
                                          List.generate(l.length, (index) {
                                        return AnimationConfiguration
                                            .staggeredGrid(
                                          position: index,
                                          duration:
                                              const Duration(milliseconds: 375),
                                          columnCount: 2,
                                          child: ScaleAnimation(
                                              child: FadeInAnimation(
                                                  child: CustomExplore(
                                            myList: l,
                                            index: index,
                                            height: 15.h,
                                            width: 45.w,
                                            isGrid: true,
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RecipePage(
                                                    recipe: l[index],
                                                  ),
                                                )),
                                          ))),
                                        );
                                      })),
                                ),
                              );
                      },
                    )
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
