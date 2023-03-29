import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/MyChefProfilePage/MyChefProfilePage.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChefProfile extends StatelessWidget {
  String id = "chefProfile";
  String chefAvatar;
  String chefName;
  DateTime posted;

  ChefProfile({
    super.key,
    required this.chefAvatar,
    required this.chefName,
    required this.posted,
  });
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chef profile"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: ListView(
          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(chefAvatar),
                  radius: 32,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chefName,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3.h,
                      width: 30.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: KprimaryColor,
                            size: 16,
                          );
                        },
                      ),
                    )
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 30.w,
                  height: 5.h,
                  child: Consumer<FilterProv>(
                    builder: (context, value, child) => BorderdButton(
                      borderColor: KprimaryColor,
                      txt: value.follow,
                      onPressed: () {
                        value.changeFollow();
                      },
                      txtColor: value.follow == 'Follow'
                          ? Colors.white
                          : KprimaryColor,
                      circular: 20,
                      padding: 0,
                      color: value.follow == 'Follow'
                          ? KprimaryColor
                          : Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Recipes",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Followers",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Following",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "8",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "60",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "3",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Divider(),
            ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                height: 2.h,
              ),
              itemCount: autoList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage(chefAvatar),
                          radius: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(chefName),
                            Text(
                              "${posted}",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.4.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: MyRecipe(index: index),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
