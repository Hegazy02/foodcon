import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/RoundedAppBar.dart';
import 'package:foodcon/Components/chefListTile.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Providers/PressedProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FollowingPage extends StatelessWidget {
  String id = "FollowingPage";
  FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    DarkmoodProv darkmood = DarkmoodProv();
    return Scaffold(
        appBar: RoundedAppBar(title: "المتابعين"),
        body: ListView.builder(
            itemCount: autoList.length,
            itemBuilder: (context, index) =>
                ChefListTile(myrecipe: autoList[index])));
  }
}
