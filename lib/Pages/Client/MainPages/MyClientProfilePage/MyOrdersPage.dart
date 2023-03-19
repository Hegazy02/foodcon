import 'package:flutter/material.dart';
import 'package:foodcon/Components/MyOrder.dart';
import 'package:foodcon/Pages/Client/MainPages/MyClientProfilePage/stepperPage.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:sizer/sizer.dart';

class MyOrdersPage extends StatelessWidget {
  String id = "myOrders";
  MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => MyOrder(
                image: autoList[index]['image'],
                title: autoList[index]['title'],
                chefName: autoList[index]['chefName'],
                index: index,
                items: 2,
                price: 60,
                ButtonTxt: "Track",
                onPressed: () {
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
