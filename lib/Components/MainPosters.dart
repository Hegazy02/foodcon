import 'dart:ui';
import 'package:flutter/material.dart';

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
