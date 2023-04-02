import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foodcon/Components/CustomExplore.dart';
import 'package:foodcon/Components/ForYouCard.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:sizer/sizer.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  @override
  ScrollController controller = ScrollController();
  Widget build(BuildContext context) {
    // try {
    //   Future.delayed(Duration(seconds: 1), () async {
    //     for (var i = 0; i < autoList.length; i++) {
    //       if (controller.hasClients) {
    //         await controller.animateTo(controller.offset + 220,
    //             duration: Duration(seconds: 4), curve: Curves.linear);
    //         print("*******");
    //       }
    //     }
    //   });
    // } catch (e) {
    //   print(e);
    // }

    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 5.h),
        Row(
          children: [
            Text(
              'For You',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          child: SizedBox(
            height: 40.h,
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
                return ForYouCard(index: index);
              },
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            Text(
              'Following',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 5),
                  itemCount: autoList.length,
                  itemBuilder: (context, index) =>
                      AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                            child: FadeInAnimation(
                                child: CustomExplore(
                          index: index,
                          height: 20.h,
                          width: 90.w,
                          isGrid: true,
                          myList: autoList,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipePage(
                                  recipe: autoList[index],
                                ),
                              )),
                        ))),
                      ))),
        ),
      ]),
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
