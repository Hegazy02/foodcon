import 'package:flutter/material.dart';
import 'package:foodcon/Components/CiruledButton.dart';
import 'package:foodcon/Components/popularChefsIcons.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/sharedPref.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:foodcon/Models/RecipeModel.dart';

class RecipePage extends StatefulWidget {
  RecipeModel recipe;

  String id = "RecipePage";
  RecipePage({super.key, required this.recipe});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  bool fav = false;
  TextStyle FirstStyle = TextStyle(fontWeight: FontWeight.bold);
  TextStyle SecondStyle =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<FilterProv>(
        builder: (context, value, child) => DefaultTabController(
            initialIndex: 2,
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  actions: [
                    Column(
                      children: [
                        Spacer(),
                        CiruledButton(
                          iconColor: widget.recipe.isLiked == true
                              ? Colors.red
                              : Colors.black,
                          icon: widget.recipe.isLiked == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                          onTap: () {
                            widget.recipe.isLiked = !widget.recipe.isLiked!;

                            if (widget.recipe.isLiked == true) {
                              sharepref().saveFavorites(item: widget.recipe);

                              print("tttttttttttttttttt");
                              // value.addFav = value.fil2[value.ScreenIndex];
                            } else {
                              print("&&&&&&&widget.recipe&&&&&&&&&");
                              print(widget.recipe.title);
                              print(widget.recipe.desc);

                              print(widget.recipe.chefAvatar);
                              print(widget.recipe.chefName);
                              print(widget.recipe.image);
                              print(widget.recipe.posted);
                              sharepref().deleteFave(
                                  item: widget.recipe, context: context);
                              print("qweeeeeeeeeee");
                              // value.removeFave = value.fil2[value.ScreenIndex];
                            }
                            value.refresh();

                            // print("** ${value.fil2[value.ScreenIndex]['isLiked']}");
                          },
                          padding: 5,
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                  expandedHeight: 350,
                  flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.only(bottom: 8.h, left: 4.w),
                      title: Row(
                        children: [
                          popularChefsIcons(
                            image: widget.recipe.chefAvatar,
                            radius: 15,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChefProfile(
                                      chefName: "${widget.recipe.chefName}",
                                      chefAvatar: "${widget.recipe.chefAvatar}",
                                      posted: widget.recipe.posted!,
                                    ),
                                  ));
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.recipe.chefName}",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "${widget.recipe.image}",
                              ),
                              fit: BoxFit.fill),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                // Colors.black.withOpacity(0.3),
                                Colors.white.withOpacity(0.1),
                                Colors.black.withOpacity(0.3),
                              ])),
                        ),
                      )),
                  title: Text(
                    "الاكلة",
                    style: FirstStyle,
                  ),
                  bottom: PreferredSize(
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 18,
                            ),
                            Text("${widget.recipe.star}"),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.alarm,
                              size: 18,
                            ),
                            Text("${widget.recipe.min}" + "min"),
                            Spacer(),
                            Text(
                              "${widget.recipe.title}",
                              style: SecondStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      preferredSize: Size(double.infinity, 50)),
                ),
                SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: KprimaryColor,
                    indicatorColor: KprimaryColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        child: Text(
                          "الوصفة",
                          style: FirstStyle,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "مكونات",
                          style: FirstStyle,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "تفاصيل",
                          style: FirstStyle,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
              body: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      style: SecondStyle,
                      textDirection: TextDirection.rtl,
                      "كبة اللحم بالبرغل ... تميزي دائماً بتقديم أطيب وصفات المقبلات الشامية الرائعة من وصفات الكبة على سفرتك، تعلمي خطوات العمل البسيطة وقدميها على سفرتك ساخنة"),
                ),
                ListView.builder(
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: KprimaryColor,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Text(
                          ingredients[index],
                          textDirection: TextDirection.rtl,
                          style: SecondStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: recipe.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: KprimaryColor,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Text(
                          recipe[index],
                          textDirection: TextDirection.rtl,
                          style: SecondStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: new Container(
        color: Colors.white, // ADD THE COLOR YOU WANT AS BACKGROUND.
        child: _tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

String details =
    "كبة اللحم بالبرغل ... تميزي دائماً بتقديم أطيب وصفات المقبلات الشامية الرائعة من وصفات الكبة على سفرتك، تعلمي خطوات العمل البسيطة وقدميها على سفرتك ساخنة";
List recipe = [
  " بمطحنة اللحم قومي بفرم اللحم فرماً ناعماً",
  " بمطحنة اللحم قومي بفرم اللحم فرماً ناعماً"
];
List ingredients = [" لحم مفروم | 1 كوب", " لحم مفروم | 1 كوب"];
