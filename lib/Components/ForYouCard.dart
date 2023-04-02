import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ForYouCard extends StatelessWidget {
  int index;
  ForYouCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/home/ForYou/1.jpg")),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                    Colors.black.withOpacity(0.3),
                  ]),
            ),
            child: Column(
              children: [
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white60, Colors.white10]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 14.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                kalam.length > 25 ? "\n.. " : "",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  kalam.length > 25
                                      ? "${kalam.substring(0, 25)}"
                                      : "${kalam}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Consumer<FilterProv>(
                                builder: (context, value, child) =>
                                    GestureDetector(
                                  onTap: () {
                                    autoList[index].isLiked =
                                        !autoList[index].isLiked!;
                                    value.refresh();
                                  },
                                  child: Icon(
                                    autoList[index].isLiked == false
                                        ? Icons.favorite_border
                                        : Icons.favorite,
                                    color: autoList[index].isLiked == false
                                        ? Colors.white
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.alarm,
                                color: Colors.white,
                              ),
                              Text(
                                "4 min",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "سهله",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String kalam = "وراك فراخ بالبصل الاحمر";
bool like = false;
