import 'package:flutter/material.dart';

class CiruledButton extends StatelessWidget {
  IconData icon;
  Color? color;
  Color? iconColor;
  Function()? onTap;
  double padding;

  CiruledButton({
    required this.icon,
    this.color,
    this.iconColor,
    required this.onTap,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(30)),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ));
  }
}
