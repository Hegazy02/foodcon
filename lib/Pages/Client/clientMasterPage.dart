import 'package:flutter/material.dart';
import 'package:foodcon/Pages/Client/MainPages/FavoritePage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyAccProfilePage.dart';
import 'package:foodcon/Pages/Client/MainPages/explorePage.dart';
import 'package:foodcon/Pages/Client/MainPages/homePage/homePage.dart';
import 'package:foodcon/Pages/Client/MainPages/searchPage.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:iconsax/iconsax.dart';
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
  int selectedpage = 4;
  Widget build(BuildContext context) {
    List<Widget> body = [
      MyAccProfilePage(),
      FavoritePage(),
      ExplorePage(),
      SearchPage(),
      HomePage(),
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
                      label: "الاعدادات", icon: Icon(Iconsax.setting_3)),
                  BottomNavigationBarItem(
                      label: "المفضلة", icon: Icon(Iconsax.heart)),
                  BottomNavigationBarItem(
                      label: "استكشاف", icon: Icon(Iconsax.map)),
                  BottomNavigationBarItem(
                      label: "البحث", icon: Icon(Iconsax.search_normal)),
                  BottomNavigationBarItem(
                      label: "الرئيسة", icon: Icon(Iconsax.home)),
                ]);
          },
        ),
        body: body[selectedpage]);
  }
}

////////////////////////////



