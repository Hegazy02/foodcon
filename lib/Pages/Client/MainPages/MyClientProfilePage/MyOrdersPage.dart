import 'package:flutter/material.dart';
import 'package:foodcon/Pages/Client/MainPages/homePage/stepperPage.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
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

class MyOrder extends StatelessWidget {
  int index;
  int items;
  int price;
  String image;
  String title;
  String chefName;
  String ButtonTxt;
  Function() onPressed;

  MyOrder(
      {required this.image,
      required this.index,
      required this.items,
      required this.ButtonTxt,
      required this.onPressed,
      required this.price,
      required this.title,
      required this.chefName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill)),
            ),
            Spacer(
              flex: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${items} items | ${chefName}",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$${price}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: KprimaryColor,
                      fontSize: 16),
                ),
              ],
            ),
            Spacer(
              flex: 7,
            ),
          ],
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40)),
            onPressed: onPressed,
            child: Text(ButtonTxt))
      ],
    );
  }
}
