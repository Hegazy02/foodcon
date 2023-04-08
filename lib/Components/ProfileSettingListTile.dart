import 'package:flutter/material.dart';
import 'package:foodcon/Global/textStyle.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/EditProfilePage.dart';
import 'package:foodcon/constants.dart';

class ProfileSettingsListTile extends StatelessWidget {
  Widget child;
  String? txt;
  String? email;
  ProfileSettingsListTile(
      {super.key, required this.child, this.txt, this.email});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              txt ?? "الشيف الشفشوفي",
              style: black14Bold,
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              email ?? "chef@gmail.com",
            )
          ],
        ),
        trailing: CircleAvatar(
          radius: 30,
          child: child,
        ),
        onTap: () => Navigator.of(context).pushNamed(EditprogilePage().id));
  }
}
