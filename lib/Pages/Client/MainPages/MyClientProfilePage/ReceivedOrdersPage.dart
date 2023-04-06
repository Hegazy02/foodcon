import 'package:flutter/material.dart';
import 'package:foodcon/Components/MyOrder.dart';
import 'package:foodcon/Components/RoundedAppBar.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class ReceivedOrdersPage extends StatelessWidget {
  String id = "receivedOrders";
  ReceivedOrdersPage({super.key});
  DarkmoodProv dartmood = DarkmoodProv();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedAppBar(title: "الطلبات المكتملة"),
      body: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => MyOrder(
                isTwoButtons: false,
                recipe: autoList[index],
                items: 1,
                price: 100,
                ButtonTxt: "اطلب مره اخرى",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipePage(
                        recipe: autoList[index],
                      ),
                    )),
                onButtonPressed: () {},
                txtColor:
                    dartmood.isDarkmood ? kDarksecondThemeColor : KprimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
