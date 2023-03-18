import 'package:flutter/material.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyFollowingPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyOrdersPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/ReceivedOrdersPage.dart';
import 'package:foodcon/Services/imagePicker.dart';
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
          contentPadding: EdgeInsets.all(7),
          leading: image == null
              ? CircleAvatar(
                  child: Text(
                    "H",
                    style: TextStyle(color: Colors.white),
                  ),
                  radius: 30,
                )
              : CircleAvatar(
                  backgroundImage: FileImage(image!),
                  radius: 30,
                ),
          title: Text("Hegazy"),
          subtitle: Text("Abdelrhmanhegazy02@gmail.com"),
          onTap: () {},
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Icon(
            Icons.delivery_dining,
            size: 40,
          ),
          title: Text("My orders"),
          onTap: () {
            Navigator.of(context).pushNamed(MyOrdersPage().id);
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Icon(
            Icons.done,
            size: 40,
          ),
          title: Text("Received orders"),
          onTap: () {
            Navigator.of(context).pushNamed(ReceivedOrdersPage().id);
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: SizedBox(
            height: 4.h,
            width: 10.w,
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
          leading: Icon(
            Icons.contact_support,
            size: 40,
          ),
          title: Text("Contact us"),
          onTap: () {},
        ),
      ],
    );
  }
}
