import 'package:flutter/material.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({super.key});

  @override
  Widget build(BuildContext context) {
    DarkmoodProv darkmood = DarkmoodProv();
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        reverse: true,
        itemBuilder: (context, index) {
          return Consumer<FilterProv>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  value.isCate = index;
                  value.fil2 = autoList
                      .where((element) =>
                          element.category == foodList[index].category)
                      .toList();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: value.isCate == index
                          ? mainthemeColor(darkmood)
                          : fillFollowedColor(darkmood),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Expanded(
                        child: ColorFiltered(
                          colorFilter: value.isCate == index
                              ? ColorFilter.matrix([
                                  -1.0, 0.0, 0.0, 0.0, 255.0, //
                                  0.0, -1.0, 0.0, 0.0, 255.0, //
                                  0.0, 0.0, -1.0, 0.0, 255.0, //
                                  0.0, 0.0, 0.0, 1.0, 0.0, //
                                ])
                              : ColorFilter.matrix([
                                  1.0, 0.0, 0.0, 0.0, 0.0, //
                                  0.0, 1.0, 0.0, 0.0, 0.0, //
                                  0.0, 0.0, 1.0, 0.0, 0.0, //
                                  0.0, 0.0, 0.0, 1.0, 0.0,
                                ]),
                          child: Image.asset(
                            "${foodList[index].icon}",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${foodList[index].category}",
                        style: TextStyle(
                            color: value.isCate == index
                                ? Colors.white
                                : Colors.black,
                            fontSize: 11),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
