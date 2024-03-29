import 'package:flutter/material.dart';
import 'package:foodcon/Components/MainPosters.dart';
import 'package:foodcon/Components/RoundedAppBar.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:provider/provider.dart';

class AllCategoriesPage extends StatelessWidget {
  String id = "AllCategoriesPage";
  AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(title: "جميع الاصناف"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<FilterProv>(
          builder: (context, value, child) => GridView.builder(
            itemCount: foodList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) => MainPostersCatergoies(
                index: index, mylist: value.fil2, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
