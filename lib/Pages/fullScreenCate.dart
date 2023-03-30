import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/CiruledButton.dart';
import 'package:foodcon/Components/popularChefsIcons.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/Services/sharedPref.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FullScreenCate extends StatelessWidget {
  List<RecipeModel> myList;
  bool? isAll = false;
  FullScreenCate({this.isAll, required this.myList});
  String? cateType = "asd";

  PageController? controller = PageController();
  @override
  Widget build(BuildContext context) {
    cateType = isAllFun(isAll: isAll, list: myList[0], cateType: cateType);
    return Scaffold(
        body: Stack(
      children: [
        Consumer<FilterProv>(builder: (context, value, child) {
          return PageView.builder(
            itemCount: myList.length,
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: (v) {
              value.ScreenIndex = controller?.page!.round();
              print("**ScreenIndex ${value}");
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("${myList[index].image}"),
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
          );
        }),
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
                      Selector<FilterProv, int?>(
                        selector: (p0, p1) => p1.ScreenIndex,
                        builder: (context, value, child) => popularChefsIcons(
                          image: myList[value!].chefAvatar,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChefProfile(
                                  chefName: "${autoList[value].chefName}",
                                  chefAvatar: "${autoList[value].chefAvatar}",
                                  posted: autoList[value].posted!,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 2.5.w,
                      ),
                      Selector<FilterProv, int?>(
                        selector: (p0, p1) => p1.ScreenIndex,
                        builder: (context, value, child) => Text(
                          "${myList[value!].chefName}",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Consumer<FilterProv>(
                        builder: (context, value, child) {
                          print(myList[value.ScreenIndex]);
                          return CiruledButton(
                              padding: 8,
                              iconColor:
                                  myList[value.ScreenIndex].isLiked == true
                                      ? Colors.red
                                      : Colors.black,
                              icon: myList[value.ScreenIndex].isLiked == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                              onTap: () async {
                                if (myList[value.ScreenIndex].isLiked ==
                                    false) {
                                  sharepref().saveFavorites(
                                      item: myList[value.ScreenIndex]);
                                } else {
                                  sharepref().deleteFave(
                                      context: context,
                                      item: myList[value.ScreenIndex]);
                                }
                                myList[value.ScreenIndex].isLiked =
                                    !myList[value.ScreenIndex].isLiked!;

                                value.refresh();
                                print(
                                    "00000000000000000000000000000000000000}");
                                print("${myList[value.ScreenIndex].isLiked}");
                              });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Selector<FilterProv, int?>(
                    selector: (p0, p1) => p1.ScreenIndex,
                    builder: (context, value, child) => Text(
                        "${myList[value!].desc}",
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Consumer<FilterProv>(
                    builder: (context, value, child) => BorderdButton(
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
    ));
  }
}

isAllFun({required isAll, required RecipeModel list, required cateType}) {
  if (isAll == false) {
    cateType = list.category;

    print("**cateType ${cateType}*");
  } else {
    cateType = "Explore";

    print("**cateType ${cateType}");
  }
  return cateType;
}
