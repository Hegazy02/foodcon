import 'package:flutter/material.dart';
import 'package:foodcon/Components/RoundedAppBar.dart';
import 'package:foodcon/Components/popularChefsIcons.dart';
import 'package:foodcon/Services/Lists/Lists.dart';

class AllChefsPage extends StatelessWidget {
  String id = "AllChefsPage";
  AllChefsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(title: "جميع الشيفات"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: popularChefsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) => AllChefsIcons(
                  index: index,
                  radius: 40,
                )),
      ),
    );
  }
}
