import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodcon/Pages/MainPages/searchPage.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Text(
          'My Favorites',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Expanded(child: Consumer<FilterProv>(
          builder: (context, value, child) {
            return AnimationLimiter(
              child: ListView.builder(
                itemCount: value.fav.length,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: CustomTile(
                          title: value.fav[index]['title'],
                          image: value.fav[index]['image'],
                          category: value.fav[index]['category'],
                          chefAvatar: value.fav[index]['chefAvatar'],
                          chefName: value.fav[index]['chefName'],
                          isLiked: value.fav[index]['isLiked'],
                          trailing: SizedBox(
                              width: 60,
                              child: IconButton(
                                  onPressed: () {
                                    value.removeFave = value.fav[index];
                                    print(value.fil2);
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
            );
          },
        ))
      ],
    );
  }
}
