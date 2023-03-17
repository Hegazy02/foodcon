import 'package:flutter/material.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyFollowingPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyOrdersPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/ReceivedOrdersPage.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class MyAccProfilePage extends StatelessWidget {
  const MyAccProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.5.h,
        ),
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: KprimaryColor,
            child: Text(
              "H",
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text("Hegazy"),
          subtitle: Text("Abdelrhmanhegazy02@gmail.com"),
          onTap: () {},
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Icon(Icons.delivery_dining),
          title: Text("My orders"),
          onTap: () {
            Navigator.of(context).pushNamed(MyOrdersPage().id);
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Icon(Icons.done),
          title: Text("Received orders"),
          onTap: () {
            Navigator.of(context).pushNamed(ReceivedOrdersPage().id);
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: SizedBox(
            height: 3.h,
            width: 7.w,
            child: Image.asset(
              "assets/images/following.png",
            ),
          ),
          title: Text("Following"),
          onTap: () {
            Navigator.of(context).pushNamed(FollowingPage().id);
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Icon(Icons.contact_support),
          title: Text("Contact us"),
          onTap: () {},
        ),
      ],
    );
  }
}
