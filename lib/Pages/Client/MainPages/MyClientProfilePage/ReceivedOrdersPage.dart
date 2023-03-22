import 'package:flutter/material.dart';
import 'package:foodcon/Components/MyOrder.dart';
import 'package:foodcon/Pages/RecipePage.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:sizer/sizer.dart';

class ReceivedOrdersPage extends StatelessWidget {
  String id = "receivedOrders";
  ReceivedOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Received orders"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => MyOrder(
                image: autoList[index]['image'],
                title: autoList[index]['title'],
                chefName: autoList[index]['chefName'],
                index: index,
                items: 1,
                price: 100,
                ButtonTxt: "Order again",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipePage(
                        list: autoList,
                        index: index,
                      ),
                    )),
                onButtonPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
