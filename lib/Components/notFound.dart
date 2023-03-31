import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        Image.asset("assets/images/not found2.png"),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "This Page Contains Nothing but Scraps",
          style: TextStyle(fontSize: 15.sp, color: Color(0xFFB7003A)),
        ),
      ],
    );
  }
}
