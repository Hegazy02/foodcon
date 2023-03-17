import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodcon/Pages/MainPages/homePage/homePage1.dart';
import 'package:foodcon/Pages/MainPages/homePage/homePage2.dart';
import 'package:foodcon/Pages/chefProfile.dart';
import 'package:foodcon/Pages/fullScreenCate.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MainHomePage extends StatelessWidget {
  MainHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Selector<FilterProv, bool>(
      selector: (p0, p1) => p1.switchHome,
      builder: (context, value, child) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: value == false ? HomePage1() : HomePage2(),
      ),
    );
  }
}
