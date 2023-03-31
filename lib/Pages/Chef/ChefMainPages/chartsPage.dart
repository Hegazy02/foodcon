import 'package:flutter/material.dart';
import 'package:foodcon/Components/charts/PieChart.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class ChartsPage extends StatelessWidget {
  ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List myReceivedOrders = [1, 1, 1, 1, 1, 1];
    List myPreparingOrders = [1, 1];
    List myFinishedOrders = [1];
    TextStyle style = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );

    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          TabBar(
              labelColor: KprimaryColor,
              indicatorColor: KprimaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text("هذا الشهر"),
                ),
                Tab(
                  child: Text("هذا الاسبوع"),
                ),
                Tab(
                  child: Text("الاجمالي"),
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(children: [
              Column(
                children: [
                  salesBar(),
                  CustomPieChart(),
                ],
              ),
              Column(
                children: [salesBar(), CustomPieChart()],
              ),
              Column(
                children: [salesBar(), CustomPieChart()],
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class salesBar extends StatelessWidget {
  String? sales;
  int? bestSeller = 0;
  salesBar({super.key, this.sales, this.bestSeller});
  TextStyle pressedStyle = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: KprimaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "الاكثر مبيعا",
                style: pressedStyle,
              ),
              Text(
                bestSeller == null ? "لايوجد" : "${bestSeller}",
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "المبيعات",
                style: pressedStyle,
              ),
              Text(
                sales == null ? "0" : "${sales}\$",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
