import 'package:flutter/material.dart';
import 'package:foodcon/Components/CiruledButton.dart';
import 'package:foodcon/Components/popularChefsIcons.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RecipePage extends StatefulWidget {
  List? list = [];
  int? index;
  String id = "RecipePage";
  RecipePage({super.key, this.list, this.index});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<FilterProv>(
        builder: (context, value, child) => DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  actions: [
                    Column(
                      children: [
                        Spacer(),
                        CiruledButton(
                          iconColor: value.favoriteracipe == true
                              ? Colors.red
                              : Colors.black,
                          icon: value.favoriteracipe == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                          onTap: () {
                            value.favoriteracipe = !value.favoriteracipe;

                            if (value.favoriteracipe == true) {
                              print("t");
                              // value.addFav = value.fil2[value.ScreenIndex];
                            } else {
                              print("qwe");
                              // value.removeFave = value.fil2[value.ScreenIndex];
                            }

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
                            image: widget.list![widget.index!]['chefAvatar'],
                            radius: 15,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChefProfile(
                                      chefName: autoList[widget.index!]
                                          ['chefName'],
                                      chefAvatar: autoList[widget.index!]
                                          ['chefAvatar'],
                                      posted: autoList[widget.index!]['posted'],
                                    ),
                                  ));
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.list![widget.index!]['chefName'],
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                widget.list![widget.index!]['image'],
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
                  title: Text("Recipe"),
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
                            Text("${widget.list![widget.index!]['star']}"),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.alarm,
                              size: 18,
                            ),
                            Text("${widget.list![widget.index!]['min']}" +
                                "min"),
                            Spacer(),
                            Text(
                              widget.list![widget.index!]['title'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      preferredSize: Size(double.infinity, 50)),
                  // shape: const RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(30.0),
                  //     bottomRight: Radius.circular(30.0),
                  //   ),
                  // ),
                ),
                SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: KprimaryColor,
                    indicatorColor: KprimaryColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        child: Text("Details"),
                      ),
                      Tab(
                        child: Text("Ingregients"),
                      ),
                      Tab(
                        child: Text("Recipe"),
                      )
                    ],
                  ),
                ))
              ],
              body: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                      "كبة اللحم بالبرغل ... تميزي دائماً بتقديم أطيب وصفات المقبلات الشامية الرائعة من وصفات الكبة على سفرتك، تعلمي خطوات العمل البسيطة وقدميها على سفرتك ساخنة"),
                ),
                ListView.builder(
                  itemCount: ll.length,
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
                          ll[index],
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: l.length,
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
                          l[index],
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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

List l = [
  " بمطحنة اللحم قومي بفرم اللحم فرماً ناعماً",
  " بمطحنة اللحم قومي بفرم اللحم فرماً ناعماً"
];
List ll = [" لحم مفروم | 1 كوب", " لحم مفروم | 1 كوب"];
