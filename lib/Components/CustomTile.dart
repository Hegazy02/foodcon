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
  Widget? trailing;
  double? padding;
  Function()? onTap;

  CustomTile(
      {required this.title,
      this.image,
      required this.category,
      this.chefAvatar,
      this.chefName,
      this.isLiked,
      this.trailing,
      this.padding,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    Map item =
        categoriesList.firstWhere((element) => element['category'] == category);

    return ListTile(
      contentPadding: EdgeInsets.all(padding ?? 10),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image != "" ? image! : Klogo,
            fit: BoxFit.fill,
          )),
      title: Text(
        "| ${item['category']}",
        style: TextStyle(fontSize: 11, color: item['color4']),
      ),
      subtitle:
          Text(title, style: TextStyle(fontSize: 16, color: Colors.black)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
