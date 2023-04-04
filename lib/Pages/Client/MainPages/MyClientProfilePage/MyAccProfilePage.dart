import 'package:flutter/material.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:foodcon/Pages/Auth/BeforeOnbordingPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/EditProfilePage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyFollowingPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyOrdersPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/ReceivedOrdersPage.dart';
import 'package:sizer/sizer.dart';

class MyAccProfilePage extends StatelessWidget {
  MyAccProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.5.h,
        ),
        ListTile(
            contentPadding: EdgeInsets.all(7),
            leading: FutureBuilder(
                future: BottomSheetHelpers.futureProfilePic,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data!),
                      radius: 30,
                    );
                  } else {
                    return CircleAvatar(
                      child: Text("H"),
                      radius: 30,
                    );
                  }
                }),
            title: Text("Hegazy"),
            subtitle: Text("Abdelrhmanhegazy02@gmail.com"),
            onTap: () => Navigator.of(context).pushNamed(EditprogilePage().id)),
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
