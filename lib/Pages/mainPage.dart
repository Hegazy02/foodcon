import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodcon/Components/Lists.dart';
import 'package:foodcon/Pages/homePages/page1.dart';
import 'package:foodcon/constants.dart';

class homePage extends StatefulWidget {
  String id = "home";
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List autoList = [
    "a",
    "s",
    "soa",
    "www",
    "qwqweqweqwe",
    "qqwe",
    "epr",
    "eporto",
    "bobo",
    "weer",
    "eertt",
    'e',
    'ee',
    'eee',
    'eeee',
    'eeeee',
    'eeeeee',
    'eeeeeeee',
    'eeeeee',
    'eeeeeee',
    'ea',
    'eaa',
    'eaaa',
    'eaaaa',
    'eaaaaa',
    'eaaaaaa',
    'eaaaaaaaaaa',
    'z',
    'zz',
    'zzz'
  ];

  String searchVal = "";
  TextEditingController editingController = TextEditingController();
  @override
  int selectedpage = 0;
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List body = [
      page1(
          height: height,
          width: width,
          autoList: autoList,
          searchVal: searchVal),
      page1(
          height: height,
          width: width,
          autoList: autoList,
          searchVal: searchVal),
      page1(
          height: height,
          width: width,
          autoList: autoList,
          searchVal: searchVal),
      page1(
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
                  label: "Profile", icon: Icon(Icons.person)),
            ]),
        body: body[selectedpage]);
  }
}

////////////////////////////



