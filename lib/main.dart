import 'package:flutter/material.dart';
import 'package:foodcon/Components/darkThemeColors.dart';
import 'package:foodcon/Pages/AllCategoriesPage.dart';
import 'package:foodcon/Pages/AllChefsPage.dart';
import 'package:foodcon/Pages/AllPopularRecipesPage.dart.dart';
import 'package:foodcon/Pages/Auth/BeforeOnbordingPage.dart';
import 'package:foodcon/Pages/Auth/OnboardingPage.dart';
import 'package:foodcon/Pages/Auth/SignInPage.dart';
import 'package:foodcon/Pages/Auth/SignUpPage.dart';
import 'package:foodcon/Pages/Chef/chefMasterPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/EditProfilePage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyFollowingPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/MyOrdersPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/ReceivedOrdersPage.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/stepperPage.dart';
import 'package:foodcon/Pages/Client/clientMasterPage.dart';
import 'package:foodcon/Providers/AddNewRecipePro.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Providers/PressedProv.dart';
import 'package:foodcon/Providers/chefProfileSearchProv.dart';
import 'package:foodcon/Providers/favProv.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/sharedPref.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Services/darkmoodSharedPref.dart';

bool? mood;
DarkmoodProv darkProv = DarkmoodProv();
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //بتخلي التطبيق ميعملش رن الا لما الحاجه الي بعد سطر دا تتنقذ
  await sharepref().instialize(); // الي هي دي
  mood = await DarkmoodSharedPref.getmood();
  print("mood ${mood}");
  darkProv.isDarkmood = mood ?? false;
  print("  darkProv.isDarkmood ${darkProv.isDarkmood}");

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
        ),
        ChangeNotifierProvider<FavoriteProv>(
          create: (context) => FavoriteProv(),
        ),
        ChangeNotifierProvider<PressedProv>(
          create: (context) => PressedProv(),
        ),
        ChangeNotifierProvider<chefProfileSearchProv>(
          create: (context) => chefProfileSearchProv(),
        ),
        ChangeNotifierProvider<AddNewRecipePro>(
          create: (context) => AddNewRecipePro(),
        ),
        ChangeNotifierProvider<DarkmoodProv>(
          create: (context) => DarkmoodProv(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        print("qqqqqqqqqqqq ${Provider.of<DarkmoodProv>(context).isDarkmood}");
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(
              Provider.of<DarkmoodProv>(context).isDarkmood, context),

          //  ThemeData(
          //     primarySwatch: mainC,
          //     primaryColor: KprimaryColor,
          //     cardColor: KprimaryColor),
          home: LoginPage(),
          routes: {
            ClientMasterPage().id: (context) => ClientMasterPage(),
            SignUpPage().id: (context) => SignUpPage(),
            BeforeOnboardingPage().id: (context) => BeforeOnboardingPage(),
            LoginPage().id: (context) => LoginPage(),
            OnBoardingPage().id: (context) => OnBoardingPage(),
            StepperPage().id: (context) => StepperPage(),
            MyOrdersPage().id: (context) => MyOrdersPage(),
            ReceivedOrdersPage().id: (context) => ReceivedOrdersPage(),
            FollowingPage().id: (context) => FollowingPage(),
            EditprogilePage().id: (context) => EditprogilePage(),
            AllCategoriesPage().id: (context) => AllCategoriesPage(),
            AllChefsPage().id: (context) => AllChefsPage(),
            AllPopularRecipesPage().id: (context) => AllPopularRecipesPage(),
            ChefMasterPage().id: (context) => ChefMasterPage(),
          },
        );
      }),
    );
  }
}
