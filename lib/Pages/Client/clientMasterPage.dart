import 'package:flutter/material.dart';
import 'package:foodcon/Pages/Client/MainPages/FavoritePage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyAccProfilePage.dart';
import 'package:foodcon/Pages/Client/MainPages/explorePage.dart';
import 'package:foodcon/Pages/Client/MainPages/homePage/homePage.dart';
import 'package:foodcon/Pages/Client/MainPages/searchPage.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:provider/provider.dart';

class ClientMasterPage extends StatefulWidget {
  String id = "clientmaster";
  ClientMasterPage({super.key});

  @override
  State<ClientMasterPage> createState() => _ClientMasterPageState();
}

class _ClientMasterPageState extends State<ClientMasterPage> {
  String searchVal = "";
  TextEditingController editingController = TextEditingController();
  @override
  int selectedpage = 0;
  Widget build(BuildContext context) {
    List body = [
      HomePage(),
      SearchPage(),
      ExplorePage(),
      FavoritePage(),
      MyAccProfilePage(),
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



