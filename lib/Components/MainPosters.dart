import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Pages/fullScreenCate.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Providers/PressedProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:provider/provider.dart';

class MainPosters extends StatelessWidget {
  int? index;
  double? width;
  String? image;
  double? sigmaX;
  double? sigmaY;
  Function()? onTap;
  double? radius;
  Widget? child;
  MainPosters(
      {this.index,
      this.width,
      this.image,
      this.sigmaX,
      this.sigmaY,
      this.child,
      this.onTap,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: InkWell(
          onTap: onTap,
          splashColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 5),
              image: DecorationImage(
                image: AssetImage(image!),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigmaX!, sigmaY: sigmaY!),
                child: child!,
              ),
            ),
          ),
        ));
  }
}

class MainPostersCatergoies extends StatelessWidget {
  int index;
  List<RecipeModel> mylist;
  double fontSize;
  double? radius;

  MainPostersCatergoies(
      {super.key,
      required this.index,
      required this.mylist,
      required this.fontSize,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProv>(
      builder: (context, value, child) => MainPosters(
        radius: radius,
        index: index,
        width: 220,
        image: foodList[index].image,
        sigmaX: 1.5,
        sigmaY: 1,
        onTap: () {
          value.ScreenIndex = 0;
          value.isCate = index;
          print(value.isCate);
          print("**isCate ${value.isCate}");

          if (index == 0) {
            mylist = autoList;
            print("**fil2 ${value}");
          } else {
            mylist = autoList
                .where(
                    (element) => element.category == foodList[index].category)
                .toList();
            print("**fil2 ${mylist}");
          }

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FullScreenCate(
                      myList: mylist, isAll: index == 0 ? true : false)));
        },
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 58, 58, 58).withOpacity(0.3),
                borderRadius: BorderRadius.circular(radius ?? 5)),
            alignment: Alignment.center,
            child: Text(
              "${foodList[index].category}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  color: Colors.white,
                  shadows: [Shadow(offset: Offset(3, 3), blurRadius: 20)]),
            )),
      ),
    );
  }
}
