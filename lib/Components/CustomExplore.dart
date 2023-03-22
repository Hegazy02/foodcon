import 'package:flutter/material.dart';
import 'package:foodcon/Components/MainPosters.dart';
import 'package:foodcon/Services/Lists/Lists.dart';

class CustomExplore extends StatelessWidget {
  final double? height;
  final double? width;
  Function()? onTap;
  int index;
  String? title;
  bool? isGrid = false;
  List myList = [];
  CustomExplore(
      {super.key,
      required this.myList,
      required this.height,
      this.width,
      required this.index,
      this.isGrid,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    Map item = categoriesList.firstWhere(
        (element) => element['category'] == myList[index]['category']);
    if (isGrid == true && myList[index]['title'].toString().length > 14) {
      title = "..${myList[index]['title'].toString().substring(0, 15)}";
    } else if (isGrid == false &&
        myList[index]['title'].toString().length > 19) {
      title = "..${myList[index]['title'].toString().substring(0, 19)}";
    } else {
      title = myList[index]['title'];
    }

    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            SizedBox(
              height: height,
              child: MainPosters(
                index: index,
                width: width,
                image: myList[index]['image'],
                sigmaX: 0.5,
                sigmaY: 0.5,
                onTap: onTap,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    // color: Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                          Colors.black.withOpacity(0.3)
                        ])),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              decoration: BoxDecoration(
                                  color: item['color4'],
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "  | ${item['category']}  ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    )),
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(right: 5, top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.grey,
                      ),
                      Text(
                        "${myList[index]['min']}",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      Spacer(),
                      Text(
                        title!,
                        style: TextStyle(
                          fontSize: isGrid == true ? 16 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Text(
                        "${myList[index]['star']}",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${myList[index]['chefName']}",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
