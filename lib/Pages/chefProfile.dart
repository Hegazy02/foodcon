import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/MyRecipe.dart';
import 'package:foodcon/Components/RoundedAppBar.dart';
import 'package:foodcon/Components/decoratedContainer.dart';
import 'package:foodcon/Global/textStyle.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/MyChefProfilePage/chefSearchPage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Providers/PressedProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChefProfile extends StatelessWidget {
  String id = "chefProfile";
  String chefAvatar;
  String chefName;
  int posted;

  ChefProfile({
    super.key,
    required this.chefAvatar,
    required this.chefName,
    required this.posted,
  });
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    DarkmoodProv darkmood = DarkmoodProv();
    return Scaffold(
      appBar: RoundedAppBar(title: "صفحة الشيف"),
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
                Text(
                  chefName,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => chefSearchPage()));
                  },
                  icon: Icon(
                    Iconsax.search_normal,
                    color: mainthemeColor(darkmood),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                  height: 5.h,
                  child: Consumer<PressedProv>(
                    builder: (context, val, child) => BorderdButton(
                      borderColor: mainthemeColor(darkmood),
                      txt: val.follow,
                      onPressed: () {
                        val.changeFollow();
                      },
                      circular: 20,
                      padding: 0,
                      txtColor: val.follow == 'متابعة'
                          ? Colors.white
                          : mainthemeColor(darkmood),
                      color: val.follow == 'متابعة'
                          ? mainthemeColor(darkmood)
                          : fillFollowedColor(darkmood),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "التقييم",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          "${4.0}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "المتابعين",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "20",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الوصفات",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "30",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 7.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemCount: week.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => decoratedContainer(
                    child: Center(
                        child: Text(
                  week[index],
                  style: darkmood.isDarkmood! ? white10Bold : black12Bold,
                ))),
              ),
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
                return GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: MyRecipe(
                    recipe: autoList[index],
                    title: autoList[index].title,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipePage(
                            recipe: autoList[index],
                          ),
                        )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List week = [
  "الجمعة",
  "الخميس",
  "الاربعاء",
  "الثلاثاء",
  "الاثنين",
  "الاحد",
  "السبت",
];
