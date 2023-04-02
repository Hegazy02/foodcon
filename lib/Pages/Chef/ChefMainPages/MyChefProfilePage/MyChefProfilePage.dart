import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/MyRecipe.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/MyChefProfilePage/chefSearchPage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hegazy",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                          size: 18,
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
                child: BorderdButton(
                  borderColor: KprimaryColor,
                  txt: "Edit profile",
                  onPressed: () {
                    print("object");
                  },
                  txtColor: KprimaryColor,
                  circular: 20,
                  padding: 0,
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
          Row(
            children: [
              Spacer(
                flex: 2,
              ),
              Container(
                height: 5.h,
                width: 60.w,
                child: BorderdButton(
                  borderColor: KprimaryColor,
                  txt: "Add new recipe",
                  onPressed: () {
                    print("object");
                  },
                  txtColor: KprimaryColor,
                  circular: 20,
                  padding: 0,
                ),
              ),
              Spacer(
                flex: 1,
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
                  color: KprimaryColor,
                ),
              ),
              Spacer(
                flex: 1,
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
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipePage(recipe: autoList[index]),
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
