import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodcon/Pages/fullScreenCate.dart';
import 'package:foodcon/Services/Lists/Lists.dart';

class MainPosters extends StatelessWidget {
  int? index;
  double? width;
  String? image;
  double? sigmaX;
  double? sigmaY;
  Function()? onTap;

  Widget? child;
  MainPosters(
      {this.index,
      this.width,
      this.image,
      this.sigmaX,
      this.sigmaY,
      this.child,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: InkWell(
          onTap: onTap,
          splashColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
  var value;
  double fontSize;

  MainPostersCatergoies(
      {super.key,
      required this.index,
      required this.value,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return MainPosters(
      index: index,
      width: 80,
      image: foodList[index].image,
      sigmaX: 1.5,
      sigmaY: 1,
      onTap: () {
        value.ScreenIndex = 0;
        value.isCate = index;
        print(value.isCate);
        print("**isCate ${value.isCate}");

        if (index == 0) {
          value.fil2 = autoList;
          print("**fil2 ${value.fil2}");
        } else {
          value.fil2 = autoList
              .where((element) => element.category == foodList[index].category)
              .toList();
          print("**fil2 ${value.fil2}");
        }

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FullScreenCate(isAll: index == 0 ? true : false)));
      },
      child: Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
          child: Text(
            "${foodList[index].category}",
            style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                shadows: [Shadow(offset: Offset(3, 3), blurRadius: 20)]),
          )),
    );
  }
}
