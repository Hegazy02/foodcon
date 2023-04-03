import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodcon/Global/textStyle.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class MyRecipe extends StatelessWidget {
  RecipeModel recipe;
  Function()? onTap;
  MyRecipe({super.key, required this.recipe, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("${recipe.image}"), fit: BoxFit.fill),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                height: 10.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.5)
                    ])),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      color: Colors.grey.withOpacity(0.3),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              Text("${recipe.title}", style: recipeTitleStyle),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              Icon(
                                Icons.alarm,
                                color: Colors.white,
                                size: 18,
                              ),
                              Text(
                                "${recipe.min}",
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Text("${recipe.level}",
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(
                                width: 3.w,
                              )
                            ],
                          ),
                          Spacer(
                            flex: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 18,
                            ),
                            Text(
                              "${recipe.star}",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Iconsax.more,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
