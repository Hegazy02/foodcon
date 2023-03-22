import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodcon/Components/CustomExplore.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Services/Lists/Lists.dart';

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
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipePage(
                          list: autoList,
                          index: index,
                        ),
                      )),
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
        Expanded(
          child: AnimationLimiter(
            child: GridView.count(
                padding: EdgeInsets.only(top: 5),
                crossAxisCount: 2,
                children: List.generate(autoList.length, (index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: 2,
                    child: ScaleAnimation(
                        child: FadeInAnimation(
                            child: CustomExplore(
                      index: index,
                      height: height! * 0.15,
                      width: width! * 0.45,
                      isGrid: true,
                      myList: autoList,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipePage(
                              list: autoList,
                              index: index,
                            ),
                          )),
                    ))),
                  );
                })),
          ),
        )
      ],
    );
  }
}


// class CustomCard extends StatelessWidget {
//   double? width;
//   double? height;
//   String? cardImage;
//   String? cardCate;
//   String? cardTitle;
//   String? cardDesc;
//   String? cardStar;
//   String? cardMin;
//   CustomCard({
//     this.width,
//     this.height,
//     this.cardImage,
//     this.cardCate,
//     this.cardTitle,
//     this.cardDesc,
//     this.cardStar,
//     this.cardMin,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Map item =
//         categoriesList.firstWhere((element) => element['category'] == cardCate);
//     return SizedBox(
//       width: width! * 0.82,
//       child: Stack(
//         alignment: Alignment.bottomLeft,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 width: width! * 0.77,
//                 height: 320,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     // color: item['color2'],
//                     gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           item['color1'],
//                           item['color2'],
//                           item['color4'],
//                         ])),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 20, top: 90),
//                   child: Column(
//                     children: [
//                       Text(
//                         "${cardTitle}",
//                         style: TextStyle(
//                             fontSize: 26, fontWeight: FontWeight.bold),
//                         textDirection: TextDirection.rtl,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 20),
//                         child: Text(
//                           "${cardDesc}",
//                           textDirection: TextDirection.rtl,
//                         ),
//                       ),
//                       Spacer(
//                         flex: 2,
//                       ),
//                       Row(
//                         children: [
//                           Icon(Icons.outdoor_grill_outlined),
//                           Text("  ${cardMin} min"),
//                           Spacer(),
//                           Icon(Icons.star_rate_outlined),
//                           Text("  ${cardStar}"),
//                           SizedBox(
//                             width: 20,
//                           )
//                         ],
//                       ),
//                       // Spacer(
//                       //   flex: 1,
//                       // ),
//                       CustomButton(
//                         txt: "View Recipe",
//                         onPressed: () {},
//                         color: item['color4'],
//                       ),
//                       Spacer()
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                   padding: EdgeInsets.only(left: 20, top: 60),
//                   child: Text(
//                     "| ${item['category']}",
//                     style: TextStyle(
//                         color: item['color4'], fontWeight: FontWeight.bold),
//                   )),
//             ],
//           ),
//           Positioned(
//             top: height! * 0.015,
//             left: width! * 0.47,
//             child: Container(
//               height: 130,
//               // width: 120,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(70),
//                 child: Image.asset(
//                   cardImage!,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(70),
//                   boxShadow: [
//                     BoxShadow(
//                       offset: Offset(0.1, 0.1),
//                       spreadRadius: 0.1,
//                       blurRadius: 10,
//                     )
//                   ]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
