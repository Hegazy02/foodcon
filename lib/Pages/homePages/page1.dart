import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodcon/Components/Lists.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:provider/provider.dart';

class page1 extends StatefulWidget {
  List filteredList = [];
  double height;
  double width;
  List autoList;
  String searchVal;
  page1(
      {required this.height,
      required this.width,
      required this.autoList,
      required this.searchVal});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: widget.height * 0.04,
              ),
              Row(
                children: [
                  Expanded(
                    child: Consumer<FilterProv>(
                      builder: (context, valprov, child) {
                        return TextField(
                          onTapOutside: (event) {
                            if (valprov.fil.length == 1 &&
                                event.position.dy > widget.height * 0.15) {
                              valprov.fil = [];
                            } else if (valprov.fil.length == 2 &&
                                event.position.dy > widget.height * 0.2) {
                              valprov.fil = [];
                            }
                            if (valprov.fil.length == 3 &&
                                event.position.dy > widget.height * 0.243) {
                              valprov.fil = [];
                            } else if (valprov.fil.length == 4 &&
                                event.position.dy > widget.height * 0.29) {
                              valprov.fil = [];
                            } else if (valprov.fil.length == 5 &&
                                event.position.dy > widget.height * 0.34) {
                              valprov.fil = [];
                            } else if (valprov.fil.length > 5 &&
                                event.position.dy > widget.height * 0.3902) {
                              valprov.fil = [];
                              //asd
                            }

                            print(event.position.dy);
                          },
                          onChanged: (value) {
                            widget.searchVal = value;

                            valprov.fil = widget.autoList.where((element) {
                              return element
                                  .toString()
                                  .startsWith(widget.searchVal.toString());
                            }).toList();
                            valprov.fil =
                                widget.searchVal.isEmpty ? [] : valprov.fil;
                            print("********${valprov.fil}");
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
                height: widget.height * 0.25,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: mainPostersList.length,
                  itemBuilder: (context, index) {
                    return MainPosters(
                      index: index,
                      filtered: widget.filteredList,
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
                height: widget.height * 0.12,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: popularChefsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return popularChefsIcons(
                      index: index,
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
                height: widget.height * 0.359,
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
                      h: widget.height,
                    );
                  },
                ),
              ),
            ]),
          ),
          ///////////////////
          Container(
            margin: EdgeInsets.only(top: widget.height * 0.07),
            child: Selector<FilterProv, List>(
              selector: (context, aa) => aa.filteredList,
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
                              Expanded(child: Text(value[index])),
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
  List? filtered;
  MainPosters({this.index, this.filtered});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320,
        child: InkWell(
          onTap: () {},
          splashColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: ExactAssetImage(mainPostersList[index!]['image']),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1),
                child: Container(
                    alignment: Alignment.center,
                    color: Color.fromARGB(255, 75, 75, 75).withOpacity(0.1),
                    child: Text(
                      mainPostersList[index!]['title'],
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          shadows: [
                            Shadow(offset: Offset(3, 3), blurRadius: 20)
                          ]),
                    )),
              ),
            ),
          ),
        ));
  }
}

/////////////////////////
class popularChefsIcons extends StatelessWidget {
  int? index;
  popularChefsIcons({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: InkWell(
            onTap: () {
              print("adsasdasd");
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(popularChefsList[index!]['image']),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(popularChefsList[index!]['name']),
      ],
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
                    image: ExactAssetImage(popularRecipesList[index!]['image']),
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
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${popularRecipesList[index!]['likes']}k",
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
        //   widget.height: h! * 0.05,
        // ),
      ],
    );
  }
}
