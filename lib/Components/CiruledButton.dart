import 'package:flutter/material.dart';

class CiruledButton extends StatelessWidget {
  IconData icon;
  Color? color;
  Color? iconColor;
  Function()? onTap;
  double padding;
  double? radius;

  CiruledButton(
      {required this.icon,
      this.color,
      this.iconColor,
      required this.onTap,
      required this.padding,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(radius ?? 30)),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ));
  }
}
