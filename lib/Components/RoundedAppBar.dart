import 'package:flutter/material.dart';
import 'package:foodcon/Global/textStyle.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  RoundedAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      title: Text(
        title,
        style: white14Bold,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
