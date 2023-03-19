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
        builder: (context, value, child) => CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                CiruledButton(
                  iconColor:
                      value.favoriteracipe == true ? Colors.red : Colors.black,
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
                SizedBox(
                  width: 10,
                ),
              ],
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(bottom: 7.h, left: 4.w),
                  title: Row(
                    children: [
                      popularChefsIcons(
                        image: widget.list![widget.index!]['chefAvatar'],
                        radius: 15,
                        onTap: () {
                          Navigator.of(context).pushNamed(ChefProfile().id);
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
              // shape: const RoundedRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(30.0),
              //     bottomRight: Radius.circular(30.0),
              //   ),
              // ),
              bottom: PreferredSize(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    height: 50,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.list![widget.index!]['title'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text("متوسط",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey))
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: KprimaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              Text(widget.list![widget.index!]['star'],
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                      ],
                    ),
                  ),
                  preferredSize: Size(0, 0)),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 100,
                            width: 100,
                            color: Colors.red,
                          ),
                        ],
                      ),
                  childCount: 20),
            ),
          ],
        ),
      ),
    );
  }
}
