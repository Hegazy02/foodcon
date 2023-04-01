import 'package:flutter/material.dart';
import 'package:foodcon/Components/charts/CurvedChart.dart';
import 'package:foodcon/Components/charts/PieChart.dart';
import 'package:foodcon/Components/decoratedContainer.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:sizer/sizer.dart';

class ChartsPage extends StatelessWidget {
  ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        Column(
          children: [
            decoratedContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dateRow(type: "السنين", itemCount: 2),
                      dateRow(type: "الاشهر", itemCount: 12),
                      dateRow(type: "الاسابيع", itemCount: 4),
                    ],
                  ),
                  salesBar()
                ],
              ),
            ),
            // decoratedContainer(child: salesBar()),
            decoratedContainer(
              child: CustomPieChart(
                  blueValue: 4, yellowValue: 2, PurpleValue: 3, greenValue: 1),
            ),
            // decoratedContainer(child: CurvedChart()),
            decoratedContainer(
                child: SizedBox(
                    height: 35.h, width: double.infinity, child: Text(""))),
          ],
        ),
      ],
    );
  }
}

class salesBar extends StatelessWidget {
  String? sales;
  int? bestSeller = 0;
  salesBar({super.key, this.sales, this.bestSeller});
  TextStyle pressedStyle = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Container(
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

class dateRow extends StatelessWidget {
  String? dateName;
  String? type;
  int? itemCount;

  dateRow({
    super.key,
    this.dateName,
    required this.type,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            dateName == null ? "الكل" : "${dateName}",
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => BottomSheetHelpers()
                  .date(context, itemcount: itemCount!, type: type!),
              child: Text(
                type!,
              )),
        ],
      ),
    );
  }
}
