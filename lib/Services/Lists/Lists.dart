import 'package:flutter/material.dart';

List autoList = [
  {
    "title": "شمكرونة بالصوص الاحمر",
    "category": "Pasta",
    "image": "assets/images/home/recipes/recipe1.jpg",
    "chefName": "Mano",
    "chefAvatar": "",
    "star": "4.6",
    "min": "20",
    "isLiked": true
  },
  {
    "title": "فراخ",
    "category": "Chickens",
    "image": "assets/images/home/recipes/recipe2.jpg",
    "chefName": "omer",
    "chefAvatar": "assets/images/home/Chefs/chef3.jpg",
    "star": "4.5",
    "min": "30",
    "isLiked": false
  },
  {
    "title": "فراخ مقلية",
    "category": "Chickens",
    "image": "assets/images/home/recipes/recipe3.jpg",
    "chefName": "Hegazy",
    "chefAvatar": "",
    "star": "4.3",
    "min": "15",
    "isLiked": true
  },
  {
    "title": "فطيرة توت",
    "category": "Desserts",
    "image": "assets/images/home/recipes/recipe4.jpg",
    "chefName": "Sakr",
    "chefAvatar": "",
    "star": "4.1",
    "min": "17",
    "isLiked": true
  },
  {
    "title": "برجر",
    "category": "Burger",
    "image": "assets/images/home/recipes/recipe5.jpg",
    "chefName": "Dude",
    "chefAvatar": "",
    "star": "3.7",
    "min": "5",
    "isLiked": false
  },
  {
    "title": "beef",
    "category": "Burger",
    "image": "assets/images/home/recipes/recipe6.jpg",
    "chefName": "Dude",
    "chefAvatar": "",
    "star": "2.6",
    "min": "10",
    "isLiked": true
  },
];
String mainPAth = "assets/images/home/main/";
List mainPostersList = [
  {"image": "${mainPAth}Grilled Chickens.jpg", "title": "Grilled Chickens"},
  {"image": "${mainPAth}With Rice.jpg", "title": "With Rice"},
  {"image": "${mainPAth}Pizza.jpg", "title": "Pizza"},
  {"image": "${mainPAth}Burger.jpg", "title": "Burger"},
  {"image": "${mainPAth}Fried Chickens.jpg", "title": "Fried Chickens"},
  {"image": "${mainPAth}Shawrma.jpg", "title": "Shawrma"},
];
String popularChefsPath = "assets/images/home/Chefs/";
List popularChefsList = [
  {"image": "${popularChefsPath}chef1.jpg", "name": "Omer"},
  {"image": "${popularChefsPath}chef2.jpg", "name": "Saleh"},
  {"image": "${popularChefsPath}chef3.jpg", "name": "Hegazy"},
  {"image": "${popularChefsPath}chef4.jpg", "name": "Amr"},
  {"image": "${popularChefsPath}chef5.jpg", "name": "Feky"},
  {"image": "${popularChefsPath}chef6.jpg", "name": "Kareem"},
  {"image": "${popularChefsPath}chef7.jpg", "name": "May"},
  {"image": "${popularChefsPath}chef8.jpg", "name": "Mark"},
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
    "category": "Grilled",
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
