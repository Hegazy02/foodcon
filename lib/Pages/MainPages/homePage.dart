import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodcon/Pages/fullScreenCate.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  List? filteredList = [];
  final double height;
  final double width;

  String? searchVal;
  HomePage(
      {this.filteredList,
      required this.height,
      required this.width,
      this.searchVal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                children: [
                  Expanded(
                    child: Consumer<FilterProv>(
                      builder: (context, valprov, child) {
                        return TextField(
                          onTapOutside: (event) {
                            if (valprov.fil1.length == 1 &&
                                event.position.dy > height * 0.15) {
                              valprov.fil1 = [];
                            } else if (valprov.fil1.length == 2 &&
                                event.position.dy > height * 0.2) {
                              valprov.fil1 = [];
                            }
                            if (valprov.fil1.length == 3 &&
                                event.position.dy > height * 0.243) {
                              valprov.fil1 = [];
                            } else if (valprov.fil1.length == 4 &&
                                event.position.dy > height * 0.29) {
                              valprov.fil1 = [];
                            } else if (valprov.fil1.length == 5 &&
                                event.position.dy > height * 0.34) {
                              valprov.fil1 = [];
                            } else if (valprov.fil1.length > 5 &&
                                event.position.dy > height * 0.3902) {
                              valprov.fil1 = [];
                              //asd
                            }

                            print(event.position.dy);
                          },
                          onChanged: (value) {
                            searchVal = value;

                            valprov.fil1 = autoList.where((element) {
                              return element['title']
                                  .toString()
                                  .startsWith(searchVal.toString());
                            }).toList();
                            valprov.fil1 =
                                searchVal!.isEmpty ? [] : valprov.fil1;
                            print("********${valprov.fil1}");
                          },
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // enabledBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(30),
                              //     borderSide:
                              //         BorderSide(width: 1, color: Colors.grey)),
                              // focusedBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(30),
                              //     borderSide:
                              //         BorderSide(width: 1, color: Colors.grey)),
                              hintText: "Search",
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ))),
                        );
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.filter_alt_sharp))
                  // CircleAvatar(
                  //   backgroundImage: AssetImage(Klogo),
                  //   backgroundColor: Colors.white,
                  // )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: height * 0.25,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    return Consumer<FilterProv>(
                      builder: (context, value, child) {
                        return MainPosters(
                          index: index,
                          width: 320,
                          image: foodList[index]['image'],
                          sigmaX: 1.5,
                          sigmaY: 1,
                          onTap: () {
                            value.isCate = index;

                            if (index == 0) {
                              value.fil2 = autoList;
                            } else {
                              value.fil2 = autoList
                                  .where((element) =>
                                      element['category'] ==
                                      foodList[index]['category'])
                                  .toList();
                            }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullScreenCate(
                                        isAll: index == 0 ? true : false)));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 75, 75, 75)
                                  .withOpacity(0.1),
                              child: Text(
                                foodList[index]['category'],
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                          offset: Offset(3, 3), blurRadius: 20)
                                    ]),
                              )),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Popular Chefs",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.12,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: popularChefsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        popularChefsIcons(
                          height: 60,
                          width: 60,
                          list: popularChefsList,
                          index: index,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(popularChefsList[index]['chefName'])
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Popular Recipes",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.359,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  // physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                      height: 10,
                    );
                  },
                  itemCount: popularRecipesList.length,
                  itemBuilder: (context, index) {
                    return popularRecipes(
                      index: index,
                      h: height,
                    );
                  },
                ),
              ),
            ]),
          ),
          ///////////////////
          Container(
            margin: EdgeInsets.only(top: height * 0.07),
            child: Selector<FilterProv, List>(
              selector: (context, aa) => aa.fil1,
              builder: (context, value, child) {
                print("qweeeeeee");
                return SizedBox(
                  height: value.isEmpty ? 0 : 300,
                  child: ListView.builder(
                    itemCount: value.length < 7 ? value.length : 6,
                    itemBuilder: (context, index) {
                      return MaterialButton(
                          onPressed: () {},
                          color: Color.fromARGB(255, 226, 225, 225),
                          padding: EdgeInsets.only(left: 10),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Row(
                            children: [
                              Expanded(child: Text(value[index]['title'])),
                            ],
                          ));
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

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

/////////////////////////
class popularChefsIcons extends StatelessWidget {
  double height;
  double width;
  int? index;
  List list = [];
  popularChefsIcons(
      {required this.height,
      required this.width,
      this.index,
      required this.list});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: () {
          print("adsasdasd");
        },
        child: Container(
          width: height,
          height: width,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(list[index!]['chefAvatar'] != ""
                    ? list[index!]['chefAvatar']
                    : Klogo),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}

////////////////////////
class popularRecipes extends StatelessWidget {
  int? index;
  double? h;
  popularRecipes({this.index, this.h});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 120,
            height: h! * 0.3,
            child: InkWell(
              onTap: () {},
              splashColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(popularRecipesList[index!]['image']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      color: Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${popularRecipesList[index!]['star']}",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Text(
                            "${popularRecipesList[index!]['min']}.min",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 30,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage(popularRecipesList[index!]['avatar']),
                child: Text(""),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(popularRecipesList[index!]['name']),
          ],
        ),
        // SizedBox(
        //   height: h! * 0.05,
        // ),
      ],
    );
  }
}
