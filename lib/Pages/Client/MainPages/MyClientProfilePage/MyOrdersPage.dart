import 'package:flutter/material.dart';
import 'package:foodcon/Components/MyOrder.dart';
import 'package:foodcon/Components/RoundedAppBar.dart';
import 'package:foodcon/Components/darkThemeColors.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/stepperPage.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants.dart';

class MyOrdersPage extends StatelessWidget {
  String id = "myOrders";
  MyOrdersPage({super.key});
  DarkmoodProv dartmood = DarkmoodProv();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(title: "طلباتي"),
      body: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => MyOrder(
                isTwoButtons: false,
                recipe: autoList[index],
                items: 2,
                price: 60,
                txtColor:
                    dartmood.isDarkmood ? kDarksecondThemeColor : KprimaryColor,
                ButtonTxt: "Track",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipePage(
                        recipe: autoList[index],
                      ),
                    )),
                onButtonPressed: () {
                  Navigator.of(context).pushNamed(StepperPage().id);
                  print("objectaa");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
