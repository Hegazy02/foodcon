import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomButton.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';

class ExplorePage extends StatelessWidget {
  final double? height;
  final double? width;
  ExplorePage({this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height! * 0.4, width: 400),
        SizedBox(
          height: height! * 0.5,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: autoList.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(left: 10),
                    child: CustomCard(
                      cardTitle: autoList[index]['title'],
                      cardCate: autoList[index]['category'],
                      cardDesc:
                          "مكرونه ميه ميه والي عاملها راجل صح صح ومفيش احلى من كدا انا ذات نفسي مره جربت اعمل حاجه غيرها معرفتش عشان مليش غيرها",
                      cardImage: autoList[index]['image'],
                      cardMin: autoList[index]['min'],
                      cardStar: autoList[index]['star'],
                      width: width,
                      height: height,
                    ));
              }),
        )
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
                height: 350,
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
                  padding: EdgeInsets.only(left: 20, top: 110),
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
                        flex: 8,
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
                      Spacer(
                        flex: 1,
                      ),
                      CustomButton(
                        txt: "View Recipe",
                        onPressed: () {},
                        color: item['color4'],
                      ),
                      Spacer(
                        flex: 1,
                      )
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
            top: height! * 0.01,
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
