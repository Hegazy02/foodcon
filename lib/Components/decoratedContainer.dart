import 'package:flutter/material.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/constants.dart';

class decoratedContainer extends StatelessWidget {
  DarkmoodProv darkmood = DarkmoodProv();
  Widget child;
  decoratedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10, top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: darkmood.isDarkmood! ? kDarkThemeColor : Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 0,
                  color: darkmood.isDarkmood!
                      ? kDarksecondThemeColor.withOpacity(0.8)
                      : Colors.grey.withOpacity(0.8),
                  offset: Offset(1, 3))
            ]),
        child: child);
  }
}
