import 'package:flutter/material.dart';
import 'package:foodcon/Components/CategoryIcons.dart';
import 'package:foodcon/Components/CustomExplore.dart';
import 'package:foodcon/Components/CustomTile.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Providers/PressedProv.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String id = "searchPage";

  String? searchVal;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Consumer<FilterProv>(
          builder: (context, valprov, child) {
            return CustomSearchBar(
              onChanged: (value) {
                searchVal = value;
                valprov.fil2 = autoList.where((element) {
                  return element.title
                      .toString()
                      .startsWith(searchVal.toString());
                }).toList();
                valprov.fil2 = searchVal!.isEmpty ? [] : valprov.fil2;
                print("********${valprov.fil2}");
              },
            );
          },
        ),
        SizedBox(
          height: 2.h,
        ),
        CategoryIcons(),
        SizedBox(
          height: 45,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Consumer<FilterProv>(
                        builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            value.isGird = index;
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            height: 45,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: value.isGird == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            child: Icon(
                              girdListOption[index],
                              color: value.isGird == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        Consumer<FilterProv>(
          builder: (context, value, child) {
            List<RecipeModel> l = value.fil2.isEmpty ? autoList : value.fil2;
            return value.isGird == 1
                ? Expanded(
                    child: AnimationLimiter(
                      child: ListView.builder(
                        itemCount: l.length,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          print(l);
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: CustomTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RecipePage(
                                            recipe: l[index],
                                          ),
                                        ));
                                  },
                                  title: "${l[index].title}",
                                  image: "${l[index].image}",
                                  category: "${l[index].category}",
                                  chefAvatar: "${l[index].chefAvatar}",
                                  chefName: "${l[index].chefName}",
                                  isLiked: l[index].isLiked,
                                  trailing: SizedBox(
                                    width: 60,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Text("${l[index].star}")
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
                          children: List.generate(l.length, (index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
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
                                      builder: (context) => RecipePage(
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
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  Function(String)? onChanged;
  CustomSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            // border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 1, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 1, color: Colors.grey)),
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 18),
            prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ))),
      ),
    );
  }
}
