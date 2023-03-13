import 'package:flutter/material.dart';
import 'package:foodcon/Pages/MainPages/homePage.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FullScreenCate extends StatelessWidget {
  bool? isAll = false;
  FullScreenCate({this.isAll});
  String? cateType = "asd";

  PageController? controller = PageController();
  @override
  Widget build(BuildContext context) {
    print("**isAll ${isAll}");
    return Scaffold(body: Consumer<FilterProv>(
      builder: (context, value, child) {
        if (isAll == false) {
          cateType = value.fil2[0]['category'];

          print("**cateType ${cateType}*");
        } else {
          cateType = "Explore";

          print("**cateType ${cateType}");
        }

        return Stack(
          children: [
            PageView.builder(
              itemCount: value.fil2.length,
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (v) {
                value.ScreenIndex = controller?.page!.round();
                print("**ScreenIndex ${value.ScreenIndex}");
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(value.fil2[index]['image']),
                              fit: BoxFit.fill)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                              Colors.black.withOpacity(0.3)
                            ]),
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 6.h, right: 4.w, left: 4.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CiruledButton(
                        icon: Icons.close,
                        color: Colors.grey[600],
                        iconColor: Colors.white,
                        onTap: () => Navigator.of(context).pop(),
                        padding: 0,
                      ),
                    ],
                  ),
                  Text(
                    cateType!,
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          popularChefsIcons(
                            height: 50,
                            width: 50,
                            index: value.ScreenIndex,
                            list: value.fil2,
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Text(
                            value.fil2[value.ScreenIndex]['chefName'],
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                          Spacer(),
                          Consumer<FilterProv>(
                            builder: (context, value, child) {
                              print(value.fil2[value.ScreenIndex]);
                              return CiruledButton(
                                iconColor: value.fil2[value.ScreenIndex]
                                            ['isLiked'] ==
                                        true
                                    ? Colors.red
                                    : Colors.black,
                                icon: value.fil2[value.ScreenIndex]
                                            ['isLiked'] ==
                                        true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.white,
                                onTap: () {
                                  value.fil2[value.ScreenIndex]['isLiked'] =
                                      !value.fil2[value.ScreenIndex]['isLiked'];
                                  if (value.fil2[value.ScreenIndex]
                                          ['isLiked'] ==
                                      true) {
                                    value.addFav =
                                        value.fil2[value.ScreenIndex];
                                  } else {
                                    value.removeFave =
                                        value.fil2[value.ScreenIndex];
                                  }

                                  print(
                                      "** ${value.fil2[value.ScreenIndex]['isLiked']}");
                                },
                                padding: 5,
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(value.fil2[value.ScreenIndex]['desc'],
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 5.h,
                      ),
                      BorderdButton(
                        txt: "View Recipe",
                        borderColor: Colors.white,
                        circular: 10,
                        onPressed: () {},
                        txtColor: Colors.white,
                        // color: Colors.red,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}

class CiruledButton extends StatelessWidget {
  IconData icon;
  Color? color;
  Color? iconColor;
  Function()? onTap;
  double padding;

  CiruledButton({
    required this.icon,
    this.color,
    this.iconColor,
    required this.onTap,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(30)),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ));
  }
}

class BorderdButton extends StatelessWidget {
  String? txt;
  Color? txtColor;
  Color? color;
  Color? borderColor;
  double? circular;
  Function()? onPressed;

  BorderdButton(
      {this.color,
      this.txt,
      this.circular,
      this.borderColor,
      this.txtColor,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(circular!),
                  border: Border.all(color: borderColor!)),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    txt!,
                    style: TextStyle(color: txtColor ?? Colors.white),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
