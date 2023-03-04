import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodcon/Components/Lists.dart';

class homePage extends StatefulWidget {
  String id = "home";
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List autoList = [
    "a",
    "s",
    "soa",
    "www",
    "qwqweqweqwe",
    "qqwe",
    "epr",
    "eporto",
    "bobo",
    "weer",
    "eertt",
    'e',
    'ee',
    'eee',
    'eeee',
    'eeeee',
    'eeeeee',
    'eeeeeeee',
    'eeeeee',
    'eeeeeee',
    'ea',
    'eaa',
    'eaaa',
    'eaaaa',
    'eaaaaa',
    'eaaaaaa',
    'eaaaaaaaaaa'
  ];
  List filteredList = [];
  bool searched = false;
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      // searched = !searched;
                      filteredList = autoList.where((element) {
                        return element.toString().startsWith(value.toString());
                      }).toList();
                      filteredList = value.isEmpty ? [] : filteredList;
                      print(filteredList);
                    });
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                Expanded(
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
                        filtered: filteredList,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      filteredList.isEmpty
                          ? Text(
                              "Popular Chefs",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text("")
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
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
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        "Popular Recipes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: popularRecipesList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return popularRecipes(
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        filteredList.length < 7 ? filteredList.length : 6,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print("asd");
                        },
                        child: Container(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            color: Colors.green,
                            child: Text(
                              filteredList[index],
                              style: TextStyle(fontSize: 16),
                            )),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
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
                    child: filtered!.isEmpty
                        ? Text(
                            mainPostersList[index!]['title'],
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                shadows: [
                                  Shadow(offset: Offset(3, 3), blurRadius: 20)
                                ]),
                          )
                        : Text("")),
              ),
            ),
          ),
        ));
  }
}

class popularChefsIcons extends StatelessWidget {
  int? index;
  popularChefsIcons({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(popularChefsList[index!]['image']),
                fit: BoxFit.fill),
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

class popularRecipes extends StatelessWidget {
  int? index;
  popularRecipes({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 120,
            height: 200,
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
                          SizedBox(
                            width: 5,
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
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(popularRecipesList[index!]['name']),
          ],
        ),
      ],
    );
  }
}
