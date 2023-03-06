import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/Pages/MainPages/homePage.dart';
import 'package:foodcon/Pages/MainPages/searchPage.dart';
import 'package:foodcon/constants.dart';

class masterPage extends StatefulWidget {
  String id = "home";
  masterPage({super.key});

  @override
  State<masterPage> createState() => _masterPageState();
}

class _masterPageState extends State<masterPage> {
  List autoList = [
    {
      "title": "مكرونة بالصوص الاحمر",
      "category": "Chickens",
      "image": "assets/images/home/recipes/recipe1.jpg",
      "chefName": "Mano",
      "chefAvatar": "",
      "star": "4.6",
      "isLiked": true
    },
    {
      "title": "فراخ",
      "category": "Chickens",
      "image": "assets/images/home/recipes/recipe2.jpg",
      "chefName": "omer",
      "chefAvatar": "assets/images/home/Chefs/chef3.jpg",
      "star": "4.5",
      "isLiked": false
    },
    {
      "title": "فراخ مقلية",
      "category": "Chickens",
      "image": "assets/images/home/recipes/recipe3.jpg",
      "chefName": "Hegazy",
      "chefAvatar": "",
      "star": "4.3",
      "isLiked": true
    },
    {
      "title": "فطيرة توت",
      "category": "Desserts",
      "image": "assets/images/home/recipes/recipe4.jpg",
      "chefName": "Sakr",
      "chefAvatar": "",
      "star": "4.1",
      "isLiked": true
    },
    {
      "title": "برحر",
      "category": "Burger",
      "image": "assets/images/home/recipes/recipe5.jpg",
      "chefName": "Dude",
      "chefAvatar": "",
      "star": "3.7",
      "isLiked": false
    },
    {
      "title": "beef",
      "category": "Burger",
      "image": "assets/images/home/recipes/recipe6.jpg",
      "chefName": "Dude",
      "chefAvatar": "",
      "star": "2.6",
      "isLiked": true
    },
  ];

  String searchVal = "";
  TextEditingController editingController = TextEditingController();
  @override
  int selectedpage = 0;
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List body = [
      HomePage(
          height: height,
          width: width,
          autoList: autoList,
          searchVal: searchVal),
      SearchPage(
          height: height,
          width: width,
          autoList: autoList,
          searchVal: searchVal),
      HomePage(
          height: height,
          width: width,
          autoList: autoList,
          searchVal: searchVal),
      HomePage(
          height: height,
          width: width,
          autoList: autoList,
          searchVal: searchVal),
      HomePage(
          height: height,
          width: width,
          autoList: autoList,
          searchVal: searchVal),
    ];

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            currentIndex: selectedpage,
            onTap: (value) {
              setState(() {
                selectedpage = value;
              });
            },
            items: [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: "search", icon: Icon(Icons.search)),
              BottomNavigationBarItem(
                  label: "Explore", icon: Icon(Icons.explore)),
              BottomNavigationBarItem(
                  label: "Favorite", icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(
                  label: "Profile", icon: Icon(Icons.person)),
            ]),
        body: body[selectedpage]);
  }
}

////////////////////////////



