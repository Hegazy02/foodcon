import 'package:flutter/material.dart';
import 'package:foodcon/Pages/Auth/Onboarding/OnboardingPage.dart';
import 'package:foodcon/Pages/Auth/SignInPage.dart';
import 'package:foodcon/Pages/Auth/SignUpPage.dart';
import 'package:foodcon/Pages/homePage.dart';
import 'package:foodcon/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: mainC,
          primaryColor: KprimaryColor,
          cardColor: KprimaryColor),
      home: homePage(),
      routes: {
        SignUpPage().id: (context) => SignUpPage(),
        LoginPage().id: (context) => LoginPage(),
        OnBoardingPage().id: (context) => OnBoardingPage(),
      },
    );
  }
}
