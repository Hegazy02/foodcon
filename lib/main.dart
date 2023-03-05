import 'package:flutter/material.dart';
import 'package:foodcon/Pages/Auth/OnboardingPage.dart';
import 'package:foodcon/Pages/Auth/SignInPage.dart';
import 'package:foodcon/Pages/Auth/SignUpPage.dart';
import 'package:foodcon/Pages/mainPage.dart';
import 'package:foodcon/Providers/filteredList.dart';

import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilterProv>(
          create: (context) => FilterProv(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: mainC,
            primaryColor: KprimaryColor,
            cardColor: KprimaryColor),
        home: SignUpPage(),
        routes: {
          homePage().id: (context) => homePage(),
          SignUpPage().id: (context) => SignUpPage(),
          LoginPage().id: (context) => LoginPage(),
          OnBoardingPage().id: (context) => OnBoardingPage(),
        },
      ),
    );
  }
}
