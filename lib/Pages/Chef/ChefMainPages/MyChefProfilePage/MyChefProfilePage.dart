import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/MyRecipe.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/MyChefProfilePage/AddNewRecipePage.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/MyChefProfilePage/chefSearchPage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  DarkmoodProv darkmood = DarkmoodProv();
  ProfilePage({super.key});
  TabController? controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                backgroundImage:
                    AssetImage("assets/images/home/Chefs/chef5.jpg"),
                radius: 32,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "Hegazy",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                height: 5.h,
                width: 20.w,
                child: BorderdButton(
                  borderColor: darkmood.isDarkmood
                      ? kDarksecondThemeColor
                      : KprimaryColor,
                  txt: "ايام العمل",
                  onPressed: () {
                    BottomSheetHelpers(isProfielPic: false)
                        .workingDays(context);
                  },
                  txtColor: darkmood.isDarkmood
                      ? kDarksecondThemeColor
                      : KprimaryColor,
                  circular: 20,
                  padding: 0,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => chefSearchPage()));
                },
                icon: Icon(
                  Iconsax.search_normal,
                  color: darkmood.isDarkmood
                      ? kDarksecondThemeColor
                      : KprimaryColor,
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
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5.h,
                width: 60.w,
                child: BorderdButton(
                  borderColor: darkmood.isDarkmood
                      ? kDarksecondThemeColor
                      : KprimaryColor,
                  txt: "اضافة وصفة جديده",
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNewRecipePage(),
                      )),
                  txtColor: darkmood.isDarkmood
                      ? kDarksecondThemeColor
                      : KprimaryColor,
                  circular: 20,
                  padding: 0,
                ),
              ),
            ],
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
    );
  }
}

class CustomDropDown extends StatelessWidget {
  CustomDropDown({super.key});
  String dropdownValue = 'Dog';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 8.w,
      child: DropdownButton<String>(
        icon: Icon(Icons.more_horiz),
        isExpanded: true,
        items: <String>[
          'Edit',
          'Delete',
        ].map<DropdownMenuItem<String>>((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(
              e,
              style: TextStyle(fontSize: 12),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          dropdownValue = newValue!;
          if (newValue == 'Edit') {
            print("Edit");
          } else {
            print("Delete");
          }
        },
      ),
    );
  }
}
