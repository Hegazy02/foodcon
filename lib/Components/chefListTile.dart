import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Providers/PressedProv.dart';

import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChefListTile extends StatelessWidget {
  DarkmoodProv darkmood = DarkmoodProv();
  RecipeModel myrecipe;
  ChefListTile({super.key, required this.myrecipe});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("${myrecipe.chefAvatar}"),
      ),
      title: Align(
          alignment: Alignment.centerRight,
          child: Text("${myrecipe.chefName}")),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("${myrecipe.star}"),
          Icon(
            Icons.star,
            color: Colors.orange,
          )
        ],
      ),
      leading: SizedBox(
        width: 30.w,
        height: 5.h,
        child: Consumer<PressedProv>(
          builder: (context, val, child) => BorderdButton(
            borderColor: mainthemeColor(darkmood),
            txt: val.follow,
            onPressed: () {
              val.changeFollow();
            },
            circular: 20,
            padding: 0,
            txtColor: val.follow == 'متابعة'
                ? Colors.white
                : mainthemeColor(darkmood),
            color: val.follow == 'متابعة'
                ? mainthemeColor(darkmood)
                : fillFollowedColor(darkmood),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChefProfile(
                  chefAvatar: myrecipe.chefAvatar!,
                  chefName: myrecipe.chefName!,
                  posted: myrecipe.posted),
            ));
      },
    );
  }
}
