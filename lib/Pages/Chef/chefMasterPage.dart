import 'package:flutter/material.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/MyChefProfilePage/MyChefProfilePage.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/chartsPage.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/chefHomePage.dart';
import 'package:foodcon/Pages/Chef/ChefMainPages/chefSettingsPage.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:provider/provider.dart';
import 'package:iconsax/iconsax.dart';

class ChefMasterPage extends StatefulWidget {
  String id = "chefmaster";
  ChefMasterPage({super.key});

  @override
  State<ChefMasterPage> createState() => _ChefMasterPageState();
}

class _ChefMasterPageState extends State<ChefMasterPage> {
  String searchVal = "";
  TextEditingController editingController = TextEditingController();
  @override
  int selectedpage = 3;
  Widget build(BuildContext context) {
    List body = [
      chefSettingsPage(),
      ProfilePage(),
      ChartsPage(),
      ChefHomePage(),
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
                      label: "البروفايل", icon: Icon(Iconsax.profile_circle)),
                  BottomNavigationBarItem(
                      label: "الاحصائيات", icon: Icon(Iconsax.chart)),
                  BottomNavigationBarItem(
                      label: "الطلبات", icon: Icon(Iconsax.shopping_cart)),
                ]);
          },
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: body[selectedpage],
        ));
  }
}

////////////////////////////



