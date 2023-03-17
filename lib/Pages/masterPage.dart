import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodcon/Pages/MainPages/FavoritePage.dart';
import 'package:foodcon/Pages/MainPages/ProfilePage.dart';
import 'package:foodcon/Pages/MainPages/homePage/homePage1.dart';
import 'package:foodcon/Pages/MainPages/homePage/mainHomePage.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/Pages/MainPages/searchPage.dart';
import 'package:foodcon/Pages/MainPages/explorePage.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';

class masterPage extends StatefulWidget {
  String id = "home";
  masterPage({super.key});

  @override
  State<masterPage> createState() => _masterPageState();
}

class _masterPageState extends State<masterPage> {
  String searchVal = "";
  TextEditingController editingController = TextEditingController();
  @override
  int selectedpage = 0;
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List body = [
      MainHomePage(),
      SearchPage(),
      ExplorePage(
        height: height,
        width: width,
      ),
      FavoritePage(),
      ProfilePage(),
    ];

    return Scaffold(
        bottomNavigationBar: Consumer<FilterProv>(
          builder: (context, val, child) {
            return BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                currentIndex: selectedpage,
                onTap: (value) {
                  setState(() {
                    selectedpage = value;
                  });
                  val.fil2 = [];
                  val.isGird = 1;
                  val.isCate = 0;
                },
                items: [
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "search", icon: Icon(Icons.search)),
                  BottomNavigationBarItem(
                      label: "Explore", icon: Icon(Icons.explore)),
                  BottomNavigationBarItem(
                      label: "Favorite", icon: Icon(Icons.favorite)),
                  BottomNavigationBarItem(
                      label: "Profile", icon: Icon(Icons.person)),
                ]);
          },
        ),
        body: body[selectedpage]);
  }
}

////////////////////////////



