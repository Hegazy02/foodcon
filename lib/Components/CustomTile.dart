import 'package:flutter/material.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';

class CustomTile extends StatelessWidget {
  String title;
  String? image;
  String category;
  String? chefName;
  String? chefAvatar;
  bool? isLiked;
  Widget? subtitle;
  double? padding;
  Function()? onTap;

  CustomTile(
      {required this.title,
      this.image,
      required this.category,
      this.chefAvatar,
      this.chefName,
      this.isLiked,
      this.subtitle,
      this.padding,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    Map item =
        categoriesList.firstWhere((element) => element['category'] == category);

    return ListTile(
      contentPadding: EdgeInsets.all(padding ?? 10),
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: mainthemeColor, borderRadius: BorderRadius.circular(20)),
        child: Text(
          "${item['category']}",
          style: TextStyle(fontSize: 11, color: Colors.white),
        ),
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(title,
            style: TextStyle(
              fontSize: 16,
            )),
      ),
      subtitle: Align(alignment: Alignment.centerRight, child: subtitle),
      trailing: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  image != "" ? image! : Klogo,
                ))),
      ),
      onTap: onTap,
    );
  }
}
