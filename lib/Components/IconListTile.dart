import 'package:flutter/material.dart';
import 'package:foodcon/Global/textStyle.dart';

class IconListTile extends StatelessWidget {
  IconData iconData;
  String title;
  Function()? onTap;
  Widget? leading;
  IconListTile(
      {super.key,
      required this.iconData,
      required this.title,
      required this.onTap,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        iconData,
        size: 30,
      ),
      title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            title,
            style: listTileStyle,
          )),
      onTap: onTap,
      leading: leading,
    );
  }
}
