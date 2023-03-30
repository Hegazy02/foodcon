import 'package:flutter/material.dart';
import 'package:foodcon/Pages/AllCategoriesPage.dart';
import 'package:foodcon/Pages/AllChefsPage.dart';
import 'package:foodcon/Pages/AllPopularRecipesPage.dart.dart';
import 'package:foodcon/Pages/Auth/BeforeOnbordingPage.dart';
import 'package:foodcon/Pages/Auth/OnboardingPage.dart';
import 'package:foodcon/Pages/Auth/SignInPage.dart';
import 'package:foodcon/Pages/Auth/SignUpPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/EditProfilePage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyFollowingPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyOrdersPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/ReceivedOrdersPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/stepperPage.dart';
import 'package:foodcon/Pages/Client/masterPage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/PressedProv.dart';
import 'package:foodcon/Providers/favProv.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/sharedPref.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //بتخلي التطبيق ميعملش رن الا لما الحاجه الي بعد سطر دا تتنقذ
  await sharepref().instialize(); // الي هي دي
  // await sharepref().deleteAll();
  runApp(MyApp());

  // sharepref().deleteFave(0);
  // sharepref().deleteFave(1);
  // sharepref().deleteFave(2);
  // sharepref().deleteFave(3);
  // sharepref().deleteFave(4);
  // sharepref().deleteFave(5);
  // sharepref().deleteFave(6);
  // sharepref().deleteFave(8);
  // sharepref().deleteFave(9);
  // sharepref().deleteFave(10);
  // sharepref().deleteFave(11);
  // sharepref().deleteFave(12);
  // sharepref().deleteFave(13);
  // sharepref().deleteFave(14);
  // sharepref().deleteFave(15);
  // sharepref().deleteFave(16);
  // sharepref().deleteFave(17);
  // sharepref().deleteFave(18);
  // sharepref().deleteFave(19);
  // sharepref().deleteFave(20);
  // sharepref().deleteFave(21);
  // sharepref().deleteFave(22);
  // sharepref().deleteFave(23);
  // sharepref().deleteFave(24);
  // sharepref().deleteFave(25);
  // sharepref().deleteFave(26);
  // sharepref().deleteFave(27);
  // sharepref().deleteFave(28);
  // sharepref().deleteFave(29);
  // sharepref().deleteFave(30);
  // sharepref().deleteFave(31);
  // sharepref().deleteFave(32);
  // sharepref().deleteFave(33);
  // sharepref().deleteFave(34);
  // sharepref().removeCounter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilterProv>(
          create: (context) => FilterProv(),
        ),
        ChangeNotifierProvider<FavoriteProv>(
          create: (context) => FavoriteProv(),
        ),
        ChangeNotifierProvider<PressedProv>(
          create: (context) => PressedProv(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: mainC,
              primaryColor: KprimaryColor,
              cardColor: KprimaryColor),
          home: masterPage(),
          routes: {
            masterPage().id: (context) => masterPage(),
            SignUpPage().id: (context) => SignUpPage(),
            BeforeOnboardingPage().id: (context) => BeforeOnboardingPage(),
            LoginPage().id: (context) => LoginPage(),
            OnBoardingPage().id: (context) => OnBoardingPage(),
            // ChefProfile().id: (context) => ChefProfile(),
            StepperPage().id: (context) => StepperPage(),
            MyOrdersPage().id: (context) => MyOrdersPage(),
            ReceivedOrdersPage().id: (context) => ReceivedOrdersPage(),
            FollowingPage().id: (context) => FollowingPage(),
            EditprogilePage().id: (context) => EditprogilePage(),
            AllCategoriesPage().id: (context) => AllCategoriesPage(),
            AllChefsPage().id: (context) => AllChefsPage(),
            AllPopularRecipesPage().id: (context) => AllPopularRecipesPage(),
          },
        );
      }),
    );
  }
}
