import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            height: 5.h,
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
                        backgroundImage:
                            AssetImage("assets/images/home/Chefs/chef5.jpg"),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hegazy"),
                          Text(
                            "${autoList[index].posted}",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          )
                        ],
                      ),
                      Spacer(),
                      CustomDropDown(),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 0.4.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: MyRecipe(
                      index: index,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipePage(recipe: autoList[index]),
                          )),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class MyRecipe extends StatelessWidget {
  int index;
  Function()? onTap;
  MyRecipe({super.key, required this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("${autoList[index].image}"),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.5)
                      ])),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("${autoList[index].title}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 3.w,
                                ),
                                Icon(
                                  Icons.alarm,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                Text(
                                  "${autoList[index].min}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(),
                                Text("${autoList[index].level}",
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(
                                  width: 3.w,
                                )
                              ],
                            ),
                            Spacer(
                              flex: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Positioned(
                top: 5,
                left: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 18,
                            ),
                            Text(
                              "${autoList[index].star}",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
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
