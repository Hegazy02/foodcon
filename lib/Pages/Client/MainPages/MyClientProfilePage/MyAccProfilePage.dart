import 'package:flutter/material.dart';
import 'package:foodcon/Components/IconListTile.dart';
import 'package:foodcon/Components/ProfileSettingListTile.dart';
import 'package:foodcon/Pages/Auth/SignInPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyFollowingPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyOrdersPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/ReceivedOrdersPage.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Services/darkmoodSharedPref.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
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
        ProfileSettingsListTile(
          child: Text("ع"),
          txt: "علي علوكة",
          email: "3aloka@gmail.com",
        ),
        IconListTile(
          iconData: Icons.delivery_dining_outlined,
          title: "طلباتي",
          onTap: () {
            Navigator.of(context).pushNamed(MyOrdersPage().id);
          },
        ),
        IconListTile(
          iconData: Icons.done,
          title: "الطلبات المكتملة",
          onTap: () {
            Navigator.of(context).pushNamed(ReceivedOrdersPage().id);
          },
        ),
        IconListTile(
          iconData: Iconsax.like_1,
          title: "من اتابعهم",
          onTap: () {
            Navigator.of(context).pushNamed(FollowingPage().id);
          },
        ),
        Consumer<DarkmoodProv>(
          builder: (context, valprov, child) => IconListTile(
            iconData: Iconsax.moon,
            title: "الوضع الليلي",
            onTap: () {
              valprov.isDarkmood = !valprov.isDarkmood;
              DarkmoodSharedPref.setmood(valprov.isDarkmood);
            },
            leading: Switch(
              value: valprov.isDarkmood,
              onChanged: (newvalue) {
                valprov.isDarkmood = newvalue;
                DarkmoodSharedPref.setmood(valprov.isDarkmood);
              },
            ),
          ),
        ),
        IconListTile(
          iconData: Iconsax.call,
          title: "تواصل معنا",
          onTap: () {},
        ),
        IconListTile(
          iconData: Icons.contact_support_outlined,
          title: "عن فودكن",
          onTap: () {},
        ),
        IconListTile(
          iconData: Iconsax.logout,
          title: "الخروج من الحساب",
          onTap: () {
            Navigator.of(context).pushNamed(LoginPage().id);
          },
        ),
        IconListTile(
          iconData: Iconsax.profile_delete,
          title: "مسح الحساب",
          onTap: () {},
        ),
      ],
    );
  }
}
