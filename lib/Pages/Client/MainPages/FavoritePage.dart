import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodcon/Components/CustomTile.dart';
import 'package:foodcon/Pages/Client/MainPages/searchPage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

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
            List ll = value.searchFav.isEmpty ? value.fav : value.searchFav;
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
                          itemCount: ll.length,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: CustomTile(
                                    title: ll[index]['title'],
                                    image: ll[index]['image'],
                                    category: ll[index]['category'],
                                    chefAvatar: ll[index]['chefAvatar'],
                                    chefName: ll[index]['chefName'],
                                    isLiked: ll[index]['isLiked'],
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RecipePage(
                                            list: ll,
                                            index: index,
                                          ),
                                        )),
                                    trailing: SizedBox(
                                        width: 60,
                                        child: IconButton(
                                            onPressed: () {
                                              value.removeFave = ll[index];
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
