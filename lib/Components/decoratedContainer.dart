import 'package:flutter/material.dart';

class decoratedContainer extends StatelessWidget {
  Widget child;
  decoratedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(0.8),
                  offset: Offset(1, 3))
            ]),
        child: child);
  }
}
