import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomSearchBar.dart';
import 'package:foodcon/Components/MainPosters.dart';
import 'package:foodcon/Components/Tricks.dart';
import 'package:foodcon/Components/popularChefsIcons.dart';
import 'package:foodcon/Pages/AllChefsPage.dart';
import 'package:foodcon/Pages/AllPopularRecipesPage.dart.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyOrdersPage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  List? filteredList = [];
  bool switchHome = false;
  String? searchVal;
  HomePage({super.key});
  DarkmoodProv darkmood = DarkmoodProv();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              // Row(
              //   children: [
              //     Expanded(
              //       child: Consumer<FilterProv>(
              //         builder: (context, valprov, child) {
              //           return CustomSearchBar(
              //             onTapOutside: (event) {
              //               if (valprov.fil1.length == 1 &&
              //                   event.position.dy > 15.h) {
              //                 valprov.fil1 = [];
              //               } else if (valprov.fil1.length == 2 &&
              //                   event.position.dy > 20.h) {
              //                 valprov.fil1 = [];
              //               }
              //               if (valprov.fil1.length == 3 &&
              //                   event.position.dy > 24.3.h) {
              //                 valprov.fil1 = [];
              //               } else if (valprov.fil1.length == 4 &&
              //                   event.position.dy > 29.h) {
              //                 valprov.fil1 = [];
              //               } else if (valprov.fil1.length == 5 &&
              //                   event.position.dy > 34.h) {
              //                 valprov.fil1 = [];
              //               } else if (valprov.fil1.length > 5 &&
              //                   event.position.dy > 39.02.h) {
              //                 valprov.fil1 = [];
              //               }

              //               print(event.position.dy);
              //             },
              //             onChanged: (value) {
              //               searchVal = value;

              //               valprov.fil1 = autoList.where((element) {
              //                 return element.title
              //                     .toString()
              //                     .startsWith(searchVal.toString());
              //               }).toList();
              //               valprov.fil1 =
              //                   searchVal!.isEmpty ? [] : valprov.fil1;
              //               print("********${valprov.fil1}");
              //             },
              //           );
              //         },
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(top: 40),
              //       child: IconButton(
              //         onPressed: () {
              //           Navigator.of(context).pushNamed(MyOrdersPage().id);
              //         },
              //         icon: Icon(Icons.delivery_dining),
              //         iconSize: 30,
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(
                height: 5.h,
              ),
              // CustomRows(
              //     RightText: "الأصناف",
              //     onTap: () =>
              //         Navigator.of(context).pushNamed(AllCategoriesPage().id)),
              // SizedBox(
              //   height: 8.h,
              //   child: ListView.separated(
              //     separatorBuilder: (context, index) {
              //       return SizedBox(
              //         width: 10,
              //       );
              //     },
              //     reverse: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: foodList.length,
              //     itemBuilder: (context, index) {
              //       return Consumer<FilterProv>(
              //         builder: (context, value, child) {
              //           return MainPostersCatergoies(
              //             index: index,
              //             mylist: value.fil1,
              //             fontSize: 16,
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: SizedBox(
                  height: 22.h,
                  width: double.infinity,
                  child: PageView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      return Consumer<FilterProv>(
                        builder: (context, value, child) {
                          return MainPostersCatergoies(
                            index: index,
                            mylist: value.fil1,
                            fontSize: 22.sp,
                            radius: 20,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomRows(
                RightText: "اشهر الشيفات",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllChefsPage(),
                    )),
              ),
              SizedBox(
                height: 14.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  reverse: true,
                  itemCount: popularChefsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AllChefsIcons(
                      index: index,
                      radius: 30,
                    );
                  },
                ),
              ),
              CustomRows(
                  RightText: "اشهر الأكلات",
                  onTap: () => Navigator.of(context)
                      .pushNamed(AllPopularRecipesPage().id)),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 24.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  // physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                      height: 10,
                    );
                  },
                  reverse: true,
                  itemCount: popularRecipesList.length,
                  itemBuilder: (context, index) {
                    return popularRecipes(
                      popularRecipeshomeList: autoList[index],
                      index: index,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipePage(
                              recipe: autoList[index],
                            ),
                          )),
                      onTapchefAvatar: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChefProfile(
                              chefName: "${autoList[index].chefName}",
                              chefAvatar: "${autoList[index].chefAvatar}",
                              posted: autoList[index].posted!,
                            ),
                          )),
                    );
                  },
                ),
              ),
              CustomRows(
                RightText: "تركات شيفات",
                onTap: () {},
              ),
              SizedBox(height: 100, child: Tricks()),
            ]),
          ),
          ///////////////////
          Container(
            margin: EdgeInsets.only(top: 7.h),
            child: Selector<FilterProv, List>(
              selector: (context, aa) => aa.fil1,
              builder: (context, value, child) {
                print("qweeeeeee");
                return SizedBox(
                  height: value.isEmpty ? 0 : 300,
                  child: ListView.builder(
                    itemCount: value.length < 7 ? value.length : 6,
                    itemBuilder: (context, index) {
                      return MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChefProfile(
                                    chefName: "${autoList[index].chefName}",
                                    chefAvatar: "${autoList[index].chefAvatar}",
                                    posted: autoList[index].posted!,
                                  ),
                                ));
                            print("www");
                          },
                          color: Color.fromARGB(255, 226, 225, 225),
                          padding: EdgeInsets.only(left: 10),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Row(
                            children: [
                              Expanded(child: Text(value[index].title)),
                            ],
                          ));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class popularRecipes extends StatelessWidget {
  RecipeModel popularRecipeshomeList;
  int? index;
  Function()? onTap;
  Function()? onTapchefAvatar;
  popularRecipes(
      {required this.popularRecipeshomeList,
      this.index,
      this.onTap,
      this.onTapchefAvatar});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            width: 180,
            height: 16.h,
            child: InkWell(
              onTap: onTap,
              splashColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("${popularRecipeshomeList.image}"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      color: Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${popularRecipeshomeList.star}",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Text(
                            "${popularRecipeshomeList.min} min",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            Text("${popularRecipeshomeList.chefName}"),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 30,
              child: GestureDetector(
                onTap: onTapchefAvatar,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage("${popularRecipeshomeList.chefAvatar}"),
                  child: Text(""),
                  radius: 18.sp,
                ),
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: h! * 0.05,
        // ),
      ],
    );
  }
}

class CustomRows extends StatelessWidget {
  DarkmoodProv darkmood = DarkmoodProv();
  String? RightText;
  Function()? onTap;
  CustomRows({super.key, this.RightText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 30,
            child: Text(
              "عرض المزيد",
              style: TextStyle(
                color: darkmood.isDarkmood == true
                    ? kDarksecondThemeColor
                    : KprimaryColor,
              ),
            ),
          ),
        ),
        Spacer(),
        Text(
          RightText!,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
