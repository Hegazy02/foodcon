import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/CiruledButton.dart';
import 'package:foodcon/Components/popularChefsIcons.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/Services/sharedPref.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FullScreenCate extends StatelessWidget {
  bool? isAll = false;
  FullScreenCate({this.isAll});
  String? cateType = "asd";

  PageController? controller = PageController();
  @override
  Widget build(BuildContext context) {
    print("**isAll ${isAll}");
    return Scaffold(body: Consumer<FilterProv>(
      builder: (context, value, child) {
        if (isAll == false) {
          cateType = value.fil2[0].category;

          print("**cateType ${cateType}*");
        } else {
          cateType = "Explore";

          print("**cateType ${cateType}");
        }

        return Stack(
          children: [
            PageView.builder(
              itemCount: value.fil2.length,
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (v) {
                value.ScreenIndex = controller?.page!.round();
                print("**ScreenIndex ${value.ScreenIndex}");
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("${value.fil2[index].image}"),
                              fit: BoxFit.fill)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                              Colors.black.withOpacity(0.3)
                            ]),
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 6.h, right: 4.w, left: 4.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CiruledButton(
                        icon: Icons.close,
                        color: Colors.grey[600],
                        iconColor: Colors.white,
                        onTap: () => Navigator.of(context).pop(),
                        padding: 0,
                      ),
                    ],
                  ),
                  Text(
                    cateType!,
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          popularChefsIcons(
                            image: value.fil2[value.ScreenIndex].chefAvatar,
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChefProfile(
                                    chefName:
                                        "${autoList[value.ScreenIndex].chefName}",
                                    chefAvatar:
                                        "${autoList[value.ScreenIndex].chefAvatar}",
                                    posted: autoList[value.ScreenIndex].posted!,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Text(
                            "${value.fil2[value.ScreenIndex].chefName}",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                          Spacer(),
                          Consumer<FilterProv>(
                            builder: (context, value, child) {
                              print(value.fil2[value.ScreenIndex]);
                              return CiruledButton(
                                  padding: 8,
                                  iconColor:
                                      value.fil2[value.ScreenIndex].isLiked ==
                                              true
                                          ? Colors.red
                                          : Colors.black,
                                  icon: value.fil2[value.ScreenIndex].isLiked ==
                                          true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.white,
                                  onTap: () async {
                                    if (value.fil2[value.ScreenIndex].isLiked ==
                                        false) {
                                      sharepref().saveFavorites(
                                          item: value.fil2[value.ScreenIndex]);
                                    } else {
                                      sharepref().deleteFave(
                                          context: context,
                                          item: value.fil2[value.ScreenIndex]);
                                    }
                                    value.fil2[value.ScreenIndex].isLiked =
                                        !value.fil2[value.ScreenIndex].isLiked!;

                                    value.lisen();
                                    print(
                                        "00000000000000000000000000000000000000}");
                                    print(
                                        "${value.fil2[value.ScreenIndex].isLiked}");
                                  });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text("${value.fil2[value.ScreenIndex].desc}",
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 5.h,
                      ),
                      BorderdButton(
                        txt: "View Recipe",
                        borderColor: Colors.white,
                        circular: 10,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipePage(
                                  recipe: autoList[value.ScreenIndex],
                                ),
                              ));
                        },
                        txtColor: Colors.white,
                        padding: 20,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
