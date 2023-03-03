import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodcon/Components/Lists.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Row(
            //   children: [],
            // ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
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
      ),
    );
  }
}

class MainPosters extends StatelessWidget {
  int? index;
  MainPosters({this.index});

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
                  ),
                ),
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
        CircleAvatar(
          backgroundImage: AssetImage(popularChefsList[index!]['image']),
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
                            "5.5k",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Text(
                            "5.min",
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
