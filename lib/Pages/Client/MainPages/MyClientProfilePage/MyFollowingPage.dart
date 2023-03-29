import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class FollowingPage extends StatelessWidget {
  String id = "FollowingPage";
  FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Following"),
      ),
      body: ListView.builder(
        itemCount: autoList.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("${autoList[index].chefAvatar}"),
          ),
          title: Text("${autoList[index].chefName}"),
          subtitle: Text("7 Recipes"),
          trailing: SizedBox(
            width: 30.w,
            height: 5.h,
            child: BorderdButton(
              borderColor: KprimaryColor,
              txt: "Followed",
              onPressed: () {
                print("object");
              },
              txtColor: KprimaryColor,
              circular: 20,
              padding: 0,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
