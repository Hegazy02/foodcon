import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomButton.dart';
import 'package:foodcon/Pages/MainPages/homePage.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';

class ExplorePage extends StatelessWidget {
  final double? height;
  final double? width;
  ExplorePage({this.height, this.width});
  @override
  ScrollController controller = ScrollController();
  Widget build(BuildContext context) {
    try {
      Future.delayed(Duration(seconds: 1), () async {
        for (var i = 0; i < autoList.length; i++) {
          if (controller.hasClients) {
            await controller.animateTo(controller.offset + 220,
                duration: Duration(seconds: 4), curve: Curves.linear);
            print("*******");
          }
        }
      });
    } catch (e) {
      print(e);
    }

    return Column(
      children: [
        SizedBox(
          height: height! * 0.05,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'For You',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height! * 0.02,
        ),
        Container(
          padding: EdgeInsets.only(left: 0),
          child: SizedBox(
            height: height! * 0.32,
            child: ListView.separated(
              controller: controller,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: autoList.length,
              itemBuilder: (context, index) {
                return CustomExplore(
                  index: index,
                  height: height! * 0.2,
                  width: width! * 0.6,
                  isGrid: false,
                  myList: autoList,
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: height! * 0.01,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Following',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: height! * 0.47,
        //   child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: autoList.length,
        //       itemBuilder: (context, index) {
        //         return Padding(
        //             padding: EdgeInsets.only(left: 10),
        //             child: CustomCard(
        //               cardTitle: autoList[index]['title'],
        //               cardCate: autoList[index]['category'],
        //               cardDesc:
        //                   "مكرونه ميه ميه والي عاملها راجل صح صح ومفيش احلى من كدا انا ذات نفسي مره جربت اعمل حاجه غيرها معرفتش عشان مليش غيرها",
        //               cardImage: autoList[index]['image'],
        //               cardMin: autoList[index]['min'],
        //               cardStar: autoList[index]['star'],
        //               width: width,
        //               height: height,
        //             ));
        //       }),
        // )

        SizedBox(
          height: height! * 0.47,
          child: GridView.builder(
            itemCount: autoList.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 2 / 2,
            ),
            itemBuilder: (context, index) {
              return CustomExplore(
                index: index,
                height: height! * 0.15,
                width: width! * 0.45,
                isGrid: true,
                myList: autoList,
              );
            },
          ),
        )
      ],
    );
  }
}

class CustomExplore extends StatelessWidget {
  final double? height;
  final double? width;

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
      this.isGrid});

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
        // SizedBox(
        //   width: 10,
        // ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  double? width;
  double? height;
  String? cardImage;
  String? cardCate;
  String? cardTitle;
  String? cardDesc;
  String? cardStar;
  String? cardMin;
  CustomCard({
    this.width,
    this.height,
    this.cardImage,
    this.cardCate,
    this.cardTitle,
    this.cardDesc,
    this.cardStar,
    this.cardMin,
  });

  @override
  Widget build(BuildContext context) {
    Map item =
        categoriesList.firstWhere((element) => element['category'] == cardCate);
    return SizedBox(
      width: width! * 0.82,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Stack(
            children: [
              Container(
                width: width! * 0.77,
                height: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: item['color2'],
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          item['color1'],
                          item['color2'],
                          item['color4'],
                        ])),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 90),
                  child: Column(
                    children: [
                      Text(
                        "${cardTitle}",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          "${cardDesc}",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Row(
                        children: [
                          Icon(Icons.outdoor_grill_outlined),
                          Text("  ${cardMin} min"),
                          Spacer(),
                          Icon(Icons.star_rate_outlined),
                          Text("  ${cardStar}"),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      // Spacer(
                      //   flex: 1,
                      // ),
                      CustomButton(
                        txt: "View Recipe",
                        onPressed: () {},
                        color: item['color4'],
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 60),
                  child: Text(
                    "| ${item['category']}",
                    style: TextStyle(
                        color: item['color4'], fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Positioned(
            top: height! * 0.015,
            left: width! * 0.47,
            child: Container(
              height: 130,
              // width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image.asset(
                  cardImage!,
                  fit: BoxFit.fill,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.1, 0.1),
                      spreadRadius: 0.1,
                      blurRadius: 10,
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
