import 'package:flutter/material.dart';

class Tricks extends StatelessWidget {
  const Tricks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 10,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) => Container(
        height: 100,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/home/Tricks/qwe.PNG"))),
      ),
    );
  }
}
