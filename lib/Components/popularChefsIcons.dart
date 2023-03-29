import 'package:flutter/material.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class popularChefsIcons extends StatelessWidget {
  String? image;
  double? radius;
  Function()? onTap;
  popularChefsIcons({this.image, this.radius, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundImage: AssetImage(image ?? Klogo),
            radius: radius,
          )),
    );
  }
}

class AllChefsIcons extends StatelessWidget {
  int index;
  double? radius;
  AllChefsIcons({super.key, required this.index, this.radius});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        popularChefsIcons(
            image: popularChefsList[index]['chefAvatar'],
            radius: radius,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChefProfile(
                    chefName: "${autoList[index].chefName}",
                    chefAvatar: "${autoList[index].chefAvatar}",
                    posted: autoList[index].posted!,
                  ),
                ))),
        SizedBox(
          height: 1.5.h,
        ),
        Text(popularChefsList[index]['chefName'])
      ],
    );
  }
}
