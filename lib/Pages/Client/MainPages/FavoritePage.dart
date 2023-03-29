import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodcon/Components/CustomTile.dart';
import 'package:foodcon/Pages/Client/MainPages/searchPage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Services/sharedPref.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<RecipeModel>? list = [];
  @override
  void initState() {
    super.initState();
    var myprov = Provider.of<FilterProv>(context, listen: false);
    myprov.getsavedDate();
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
              onChanged: (value) async {
                valprov.searchFav = valprov.favelistprov.where((element) {
                  return element.title.toString().startsWith(value.toString());
                }).toList();
                valprov.searchFav = value.isEmpty ? [] : valprov.searchFav;
                print("********${valprov.searchFav}");
              },
            );
          },
        ),
        Consumer<FilterProv>(
          builder: (context, value, child) {
            list = value.favelistprov;
            print("=============");

            List<RecipeModel>? ll =
                value.searchFav.isEmpty ? list : value.searchFav;
            print("@@@@@@@@@@@@@@@@@ my ll");
            print(ll);
            return ll!.length > 0
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
                                  title: ll[index].title!,
                                  category: ll[index].category!,
                                  image: ll[index].image,
                                  chefName: ll[index].chefName!,
                                  chefAvatar: ll[index].chefAvatar,

                                  // isLiked: list[index]['isLiked'],
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
                                            sharepref().deleteFave(
                                                item: ll[index],
                                                context: context);

                                            // value.favelistprov = ll;

                                            if (value.searchFav.isNotEmpty) {
                                              value.removeSearchFave =
                                                  ll[index];
                                            }

                                            // print("******${value.searchFav}");
                                            // print("******${ll}");
                                            // print("******${value.fav}");
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ))),
                                )),
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
