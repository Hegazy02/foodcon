import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodcon/Components/charts/CurvedChart.dart';
import 'package:foodcon/Components/charts/PieChart.dart';
import 'package:foodcon/Components/decoratedContainer.dart';
import 'package:foodcon/Global/textStyle.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:sizer/sizer.dart';

class ChartsPage extends StatelessWidget {
  Random random = Random();

  ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int myrandom = random.nextInt(16);

    return Column(
      children: [
        SizedBox(
          height: 3.5.h,
        ),
        SizedBox(
          height: 19.h,
          width: double.infinity,
          child: decoratedContainer(
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
        ),
        SizedBox(
          height: 38.h,
          width: double.infinity,
          child: decoratedContainer(
            child: CustomPieChart(
                blueValue: 4, yellowValue: 2, PurpleValue: 3, greenValue: 1),
          ),
        ),
        decoratedContainer(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              quotes[myrandom]['quote'],
              textDirection: TextDirection.rtl,
              style: pressedStyle,
            ),
            SizedBox(
                height: 16.h,
                width: double.infinity,
                child: Image.asset(
                  quotes[myrandom]['image'],
                ))
          ],
        )),
      ],
    );
  }
}

class salesBar extends StatelessWidget {
  String? sales;
  int? bestSeller = 0;
  salesBar({super.key, this.sales, this.bestSeller});

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
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () => BottomSheetHelpers(isProfielPic: false)
                  .date(context: context, itemcount: itemCount!, type: type!),
              child: Text(
                type!,
              )),
        ],
      ),
    );
  }
}

List quotes = [
  {
    "quote": "الرؤية بدون تنفيذ لا تسمى إلا هلوسة",
    "image": "assets/images/chefCaracters/1.png"
  },
  {
    "quote": "النجاح ليس مسألة حظ، بل هو نتيجة موهبة وعمل جاد",
    "image": "assets/images/chefCaracters/2.png"
  },
  {
    "quote": "إذا لم تفعل شيئًا بجدية، فلن تحصل عليه",
    "image": "assets/images/chefCaracters/3.png"
  },
  {
    "quote": "الطبخ هو الفن الذي يجعل الأكل يتغير إلى لحظات لا تُنسى",
    "image": "assets/images/chefCaracters/4.png"
  },
  {
    "quote":
        "المطبخ هو المكان الذي يجعلنا نتواصل مع أنفسنا والآخرين من خلال الطعام",
    "image": "assets/images/chefCaracters/5.png"
  },
  {
    "quote": "أفضل طعام يأتي من المطابخ الصغيرة",
    "image": "assets/images/chefCaracters/6.png"
  },
  {
    "quote": "الطعام هو أساس الحياة، والطهي هو فن وشغف يشاركه الأشخاص",
    "image": "assets/images/chefCaracters/7.png"
  },
  {
    "quote": "إذا كان الطعام هو لغة الحب، فإن الطهاة هم المترجمون",
    "image": "assets/images/chefCaracters/8.png"
  },
  {
    "quote": "إنّ الطهي هو نوع من الفنون الجميلة",
    "image": "assets/images/chefCaracters/9.png"
  },
  {
    "quote": "الطعام الجيد يأتي من المطابخ الصغيرة تحتوي على قلوب كبيرة",
    "image": "assets/images/chefCaracters/10.png"
  },
  {
    "quote": "الطهي هو الشغف الذي يمزج بين المذاق والفن والحب",
    "image": "assets/images/chefCaracters/11.png"
  },
  {
    "quote": "إنّ الطعام الجيد يمكن أن يغير حياتنا، والطهي هو أداة لتحسينها",
    "image": "assets/images/chefCaracters/12.png"
  },
  {
    "quote": "إذا أردت أن تجعل شخصاً سعيداً، فأطعمه",
    "image": "assets/images/chefCaracters/13.png"
  },
  {
    "quote": "إذا كنت تقدم وجبة طعام جيدة، فستحظى بالكثير من الأصدقاء",
    "image": "assets/images/chefCaracters/14.png"
  },
  {
    "quote": "إذا كنت تريد أن تكون مبدعاً، فابتكر طريقة لطهي الطعام",
    "image": "assets/images/chefCaracters/15.png"
  },
  {
    "quote": "الطهي هو طريقة للتعبير عن الحب والعناية بالآخرين",
    "image": "assets/images/chefCaracters/16.png"
  },
];
