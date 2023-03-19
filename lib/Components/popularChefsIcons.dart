import 'package:flutter/material.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/constants.dart';

class popularChefsIcons extends StatelessWidget {
  int? index;
  List? list = [];
  String? image;
  double? radius;
  Function()? onTap;
  popularChefsIcons(
      {this.index, this.list, this.image, this.radius, this.onTap});

  @override
  Widget build(BuildContext context) {
    String avatar = image == null ? list![index!]['chefAvatar'] : image;
    return ClipRRect(
      child: InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundImage: AssetImage(avatar != "" ? avatar : Klogo),
            radius: radius,
          )),
    );
  }
}
