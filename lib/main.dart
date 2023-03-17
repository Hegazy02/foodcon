import 'package:flutter/material.dart';
import 'package:foodcon/Pages/Auth/OnboardingPage.dart';
import 'package:foodcon/Pages/Auth/SignInPage.dart';
import 'package:foodcon/Pages/Auth/SignUpPage.dart';
import 'package:foodcon/Pages/MainPages/homePage/stepperPage.dart';
import 'package:foodcon/Pages/MainPages/searchPage.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/Pages/masterPage.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: mainC,
              primaryColor: KprimaryColor,
              cardColor: KprimaryColor),
          home: SignUpPage(),
          routes: {
            masterPage().id: (context) => masterPage(),
            SignUpPage().id: (context) => SignUpPage(),
            LoginPage().id: (context) => LoginPage(),
            OnBoardingPage().id: (context) => OnBoardingPage(),
            ChefProfile().id: (context) => ChefProfile(),
            StepperPage().id: (context) => StepperPage(),
          },
        );
      }),
    );
  }
}
