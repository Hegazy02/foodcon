import 'package:flutter/material.dart';
import 'package:foodcon/Models/RecipeModel.dart';

List<RecipeModel> autoList = [
  RecipeModel.fromJson({
    "title": "c",
    "category": "Pasta",
    "image": "assets/images/home/recipes/recipe1.jpg",
    "chefName": "Mano",
    "chefAvatar": "${popularChefsPath}chef1.jpg",
    "star": 4.6,
    "min": 20,
    "isLiked": false,
    "desc":
        "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
    "level": "Easy",
    "posted": DateTime.now(),
  }),
  RecipeModel.fromJson({
    "title": "مكرونة بالصوص الاحمر",
    "category": "Pasta",
    "image": "assets/images/home/recipes/recipe1.jpg",
    "chefName": "Mano",
    "chefAvatar": "${popularChefsPath}chef1.jpg",
    "star": 4.6,
    "min": 20,
    "isLiked": false,
    "desc":
        "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
    "level": "Easy",
    "posted": DateTime.now(),
  }),
  RecipeModel.fromJson({
    "title": "مكرونة بالصوص الاحمر",
    "category": "Pizza",
    "image": "assets/images/home/recipes/recipe1.jpg",
    "chefName": "Mano",
    "chefAvatar": "${popularChefsPath}chef1.jpg",
    "star": 4.6,
    "min": 20,
    "isLiked": false,
    "desc":
        "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
    "level": "Medium",
    "posted": DateTime.now(),
  }),
  RecipeModel.fromJson({
    "title": "فراخ",
    "category": "Chickens",
    "image": "assets/images/home/recipes/recipe2.jpg",
    "chefName": "omer",
    "chefAvatar": "assets/images/home/Chefs/chef3.jpg",
    "star": 4.5,
    "min": 30,
    "isLiked": false,
    "desc":
        "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
    "level": "Easy",
    "posted": DateTime.now(),
  }),
  RecipeModel.fromJson(
    {
      "title": "فراخ",
      "category": "Fried",
      "image": "assets/images/home/recipes/recipe2.jpg",
      "chefName": "omer",
      "chefAvatar": "assets/images/home/Chefs/chef3.jpg",
      "star": 4.5,
      "min": 30,
      "isLiked": false,
      "desc":
          "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
      "level": "Hard",
      "posted": DateTime.now(),
    },
  ),
  RecipeModel.fromJson(
    {
      "title": "فراخ مقلية",
      "category": "Chickens",
      "image": "assets/images/home/recipes/recipe3.jpg",
      "chefName": "Hegazy",
      "chefAvatar": "${popularChefsPath}chef2.jpg",
      "star": 4.3,
      "min": 15,
      "isLiked": false,
      "desc":
          "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
      "level": "Easy",
      "posted": DateTime.now(),
    },
  ),
  RecipeModel.fromJson(
    {
      "title": "فطيرة توت",
      "category": "Desserts",
      "image": "assets/images/home/recipes/recipe4.jpg",
      "chefName": "Sakr",
      "chefAvatar": "${popularChefsPath}chef3.jpg",
      "star": 4.1,
      "min": 17,
      "isLiked": false,
      "desc":
          "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
      "level": "Easy",
      "posted": DateTime.now(),
    },
  ),
  RecipeModel.fromJson(
    {
      "title": "برجر",
      "category": "Burger",
      "image": "assets/images/home/recipes/recipe5.jpg",
      "chefName": "Dude",
      "chefAvatar": "${popularChefsPath}chef4.jpg",
      "star": 3.7,
      "min": 5,
      "isLiked": false,
      "desc":
          "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
      "level": "Easy",
      "posted": DateTime.now(),
    },
  ),
  RecipeModel.fromJson(
    {
      "title": "beef",
      "category": "Burger",
      "image": "assets/images/home/recipes/recipe6.jpg",
      "chefName": "Dude",
      "chefAvatar": "${popularChefsPath}chef5.jpg",
      "star": 2.6,
      "min": 10,
      "isLiked": true,
      "desc":
          "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
      "level": "Easy",
      "posted": DateTime.now(),
    },
  ),
  RecipeModel.fromJson(
    {
      "title": "beef",
      "category": "Shawrma",
      "image": "assets/images/home/recipes/recipe6.jpg",
      "chefName": "Dude",
      "chefAvatar": "${popularChefsPath}chef5.jpg",
      "star": 2.6,
      "min": 10,
      "isLiked": true,
      "desc":
          "hasog ihwaei oefhweh asodnvash sdfh sduhvo0 fh08arf hgsdfwey0gvah ewehrg sdfsd paobn sljghpa sodjna sldnasdf weggewr ewrg fhoi",
      "level": "Easy",
      "posted": DateTime.now(),
    },
  ),
];
String mainPAth = "assets/images/home/main/";

String popularChefsPath = "assets/images/home/Chefs/";
List popularChefsList = [
  {"chefAvatar": "${popularChefsPath}chef1.jpg", "chefName": "Omer"},
  {"chefAvatar": "${popularChefsPath}chef2.jpg", "chefName": "Saleh"},
  {"chefAvatar": "${popularChefsPath}chef3.jpg", "chefName": "Hegazy"},
  {"chefAvatar": "${popularChefsPath}chef4.jpg", "chefName": "Amr"},
  {"chefAvatar": "${popularChefsPath}chef5.jpg", "chefName": "Feky"},
  {"chefAvatar": "${popularChefsPath}chef6.jpg", "chefName": "Kareem"},
  {"chefAvatar": "${popularChefsPath}chef7.jpg", "chefName": "May"},
  {"chefAvatar": "${popularChefsPath}chef8.jpg", "chefName": "Mark"},
];
String popularRecipesPath = "assets/images/home/recipes/";
List popularRecipesList = [
  {
    "image": "${popularRecipesPath}recipe1.jpg",
    "name": "Omer",
    "avatar": "${popularChefsPath}chef1.jpg",
    "star": "4.6",
    "min": "5"
  },
  {
    "image": "${popularRecipesPath}recipe2.jpg",
    "name": "Omer",
    "avatar": "${popularChefsPath}chef1.jpg",
    "star": "4.2",
    "min": "4"
  },
  {
    "image": "${popularRecipesPath}recipe3.jpg",
    "name": "Mark",
    "avatar": "${popularChefsPath}chef8.jpg",
    "star": "4",
    "min": "5"
  },
  {
    "image": "${popularRecipesPath}recipe4.jpg",
    "name": "May",
    "avatar": "${popularChefsPath}chef7.jpg",
    "star": "3.8",
    "min": "3"
  },
  {
    "image": "${popularRecipesPath}recipe5.jpg",
    "name": "Saleh",
    "avatar": "${popularChefsPath}chef2.jpg",
    "star": "3.7",
    "min": "5"
  },
  {
    "image": "${popularRecipesPath}recipe6.jpg",
    "name": "Hegazy",
    "avatar": "${popularChefsPath}chef3.jpg",
    "star": "3.2",
    "min": "3"
  },
  {
    "image": "${popularRecipesPath}recipe7.jpg",
    "name": "Kareem",
    "avatar": "${popularChefsPath}chef6.jpg",
    "star": "3",
    "min": "6"
  },
  {
    "image": "${popularRecipesPath}recipe8.jpg",
    "name": "Feky",
    "avatar": "${popularChefsPath}chef5.jpg",
    "star": "2.6",
    "min": "4"
  },
  {
    "image": "${popularRecipesPath}recipe9.jpg",
    "name": "Amr",
    "avatar": "${popularChefsPath}chef4.jpg",
    "star": "2.1",
    "min": "5"
  },
];
List categoriesList = [
  {
    "category": "Chickens",
    "color1": Color.fromARGB(255, 250, 221, 176),
    "color2": Color.fromARGB(255, 206, 165, 104),
    "color4": Colors.orange
  },
  {
    "category": "Pizza",
    "color1": Color.fromARGB(255, 235, 233, 153),
    "color2": Color.fromARGB(255, 214, 216, 113),
    "color4": Colors.yellow
  },
  {
    "category": "Burger",
    "color1": Color.fromARGB(255, 236, 154, 154),
    "color2": Color.fromARGB(255, 216, 130, 115),
    "color4": Colors.red
  },
  {
    "category": "Fried",
    "color1": Color.fromARGB(255, 236, 154, 154),
    "color2": Color.fromARGB(255, 216, 130, 115),
    "color4": Colors.red
  },
  {
    "category": "Chickens",
    "color1": Color.fromARGB(255, 235, 153, 153),
    "color2": Color.fromARGB(255, 223, 128, 112),
    "color4": Colors.redAccent
  },
  {
    "category": "Pasta",
    "color1": Color.fromARGB(255, 153, 235, 157),
    "color2": Color.fromARGB(255, 110, 209, 119),
    "color4": Colors.green
  },
  {
    "category": "Desserts",
    "color1": Color.fromARGB(255, 165, 129, 224),
    "color2": Color.fromARGB(255, 146, 119, 221),
    "color4": Colors.deepPurple
  },
  {
    "category": "Shawrma",
    "color1": Color.fromARGB(255, 216, 218, 216),
    "color2": Color.fromARGB(255, 174, 175, 174),
    "color4": Colors.grey
  },
  {
    "category": "Others",
    "color1": Color.fromARGB(255, 159, 175, 159),
    "color2": Color.fromARGB(255, 138, 146, 138),
    "color4": Color.fromARGB(255, 122, 121, 121)
  },
];
List foodList = [
  {
    "category": "Explore",
    "icon": "assets/images/home/icons/all.png",
    "image": "${mainPAth}Grilled Chickens.jpg",
  },
  {
    "category": "Pasta",
    "icon": "assets/images/home/icons/spaguetti.png",
    "image": "${mainPAth}With Rice.jpg",
  },
  {
    "category": "Burger",
    "icon": "assets/images/home/icons/burger.png",
    "image": "${mainPAth}Burger.jpg",
  },
  {
    "category": "Chickens",
    "icon": "assets/images/home/icons/chicken.png",
    "image": "${mainPAth}Grilled Chickens.jpg",
  },
  {
    "category": "Pizza",
    "icon": "assets/images/home/icons/pizza.png",
    "image": "${mainPAth}Pizza.jpg",
  },
  {
    "category": "Fried",
    "icon": "assets/images/home/icons/fried chicken.png",
    "image": "${mainPAth}Fried Chickens.jpg",
  },
  {
    "category": "Shawrma",
    "icon": "assets/images/home/icons/shawarma.png",
    "image": "${mainPAth}Shawrma.jpg",
  }
];
List girdListOption = [Icons.grid_view, Icons.list];
