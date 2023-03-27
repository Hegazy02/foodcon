import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodcon/Components/CustomTile.dart';
import 'package:foodcon/Pages/Client/MainPages/searchPage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/sharedPref.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List list = [];

  @override
  void initState() {
    super.initState();

    sharepref().getFavorites(list);

    print("!!!!!!!!!!!!!! $list");
    Future.delayed(
      Duration(seconds: 2),
      () => print("!!!!!!!!!!!!!! $list"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'My Favorites',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Consumer<FilterProv>(
          builder: (context, valprov, child) {
            return CustomSearchBar(
              onChanged: (value) {
                valprov.searchFav = valprov.fav.where((element) {
                  return element['title']
                      .toString()
                      .startsWith(value.toString());
                }).toList();
                valprov.searchFav = value.isEmpty ? [] : valprov.searchFav;
                print("********${valprov.searchFav}");
              },
            );
          },
        ),
        Consumer<FilterProv>(
          builder: (context, value, child) {
            if (value.favelistprov.isNotEmpty) {
              list = value.favelistprov;
            }
            // value.favelistprov = list;
            List ll = value.searchFav.isEmpty ? list : value.searchFav;
            return ll.length > 0
                ? Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      AnimationLimiter(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: list.length,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: CustomTile(
                                    title: list[index]['title'],
                                    image: list[index]['image'],
                                    category: list[index]['category'],
                                    chefAvatar: list[index]['chefAvatar'],
                                    chefName: list[index]['chefName'],
                                    isLiked: list[index]['isLiked'],
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RecipePage(
                                            list: list,
                                            index: index,
                                          ),
                                        )),
                                    trailing: SizedBox(
                                        width: 60,
                                        child: IconButton(
                                            onPressed: () {
                                              // value.removeFave = ll[index];
                                              sharepref().deleteFave(index + 1,
                                                  list: list);
                                              print("index ${index}");
                                              value.favelistprov = list;

                                              if (value.searchFav.isNotEmpty) {
                                                value.removeSearchFave =
                                                    ll[index];
                                              }

                                              print("******${value.searchFav}");
                                              print("******${ll}");
                                              print("******${value.fav}");
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ))),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Image.asset("assets/images/not found2.png"),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "This Page Contains Nothing but Scraps",
                        style: TextStyle(
                            fontSize: 15.sp, color: Color(0xFFB7003A)),
                      ),
                      // Spacer(),
                    ],
                  );
          },
        )
      ],
    );
  }
}
