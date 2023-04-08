import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/CiruledButton.dart';
import 'package:foodcon/Components/MyOrder.dart';
import 'package:foodcon/Components/decoratedContainer.dart';
import 'package:foodcon/Components/notFound.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class ChefHomePage extends StatelessWidget {
  ChefHomePage({super.key});
  DarkmoodProv dark = DarkmoodProv();
  @override
  Widget build(BuildContext context) {
    List myReceivedOrders = [1, 1, 1, 1, 1, 1];
    List myPreparingOrders = [1, 1];
    List myFinishedOrders = [1];
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          TabBar(
              labelColor:
                  dark.isDarkmood! ? kDarksecondThemeColor : KprimaryColor,
              indicatorColor:
                  dark.isDarkmood! ? kDarksecondThemeColor : KprimaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text("مكتمل"),
                ),
                Tab(
                  child: Text("جاري التحضير"),
                ),
                Tab(
                  child: Text("الطلبات"),
                ),
              ]),
          Expanded(
            child: TabBarView(children: [
              myFinishedOrders.isEmpty
                  ? NotFound()
                  : ListView.builder(
                      itemCount: myFinishedOrders.length,
                      itemBuilder: (context, index) => MyOrder(
                        isTwoButtons: false,
                        recipe: RecipeModel(
                            image: "assets/images/home/ForYou/1.jpg",
                            title: "وراك فراخ"),
                        items: 1,
                        ButtonTxt: "تسليم",
                        onButtonPressed: () {},
                        onCancelButton: () {},
                        price: 70,
                        onTap: () {},
                        txtColor: dark.isDarkmood!
                            ? kDarksecondThemeColor
                            : KprimaryColor,
                      ),
                    ),
              myPreparingOrders.isEmpty
                  ? NotFound()
                  : ListView.builder(
                      itemCount: myPreparingOrders.length,
                      itemBuilder: (context, index) => MyOrder(
                        isTwoButtons: false,
                        recipe: RecipeModel(
                            image: "assets/images/home/ForYou/1.jpg",
                            title: "وراك فراخ"),
                        items: 1,
                        ButtonTxt: "تم التحضير",
                        onButtonPressed: () {},
                        price: 70,
                        onTap: () {},
                        txtColor: dark.isDarkmood!
                            ? kDarksecondThemeColor
                            : KprimaryColor,
                      ),
                    ),
              myReceivedOrders.isEmpty
                  ? NotFound()
                  : ListView.builder(
                      itemCount: myReceivedOrders.length,
                      itemBuilder: (context, index) => MyOrder(
                        isTwoButtons: true,
                        recipe: RecipeModel(
                            image: "assets/images/home/ForYou/1.jpg",
                            title: "وراك فراخ"),
                        items: 1,
                        ButtonTxt: "اقبل",
                        onButtonPressed: () {},
                        onCancelButton: () {},
                        price: 70,
                        onTap: () {},
                        txtColor: dark.isDarkmood!
                            ? kDarksecondThemeColor
                            : KprimaryColor,
                      ),
                    ),
            ]),
          )
        ],
      ),
    );
  }
}
