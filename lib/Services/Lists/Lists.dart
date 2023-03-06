import 'package:flutter/material.dart';

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
  {"category": "Chickens", "color": Colors.orange},
  {"category": "Pizza", "color": Colors.yellow},
  {"category": "Burger", "color": Colors.red},
  {"category": "Grilled", "color": Colors.redAccent},
  {"category": "Pasta", "color": Colors.green},
  {"category": "Desserts", "color": Colors.deepPurple},
  {"category": "Shawrma", "color": Colors.grey},
  {"category": "Others", "color": Colors.grey},
];
