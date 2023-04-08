import 'package:flutter/material.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:sizer/sizer.dart';

class CustomSearchBar extends StatelessWidget {
  Function(String)? onChanged;
  Function(PointerDownEvent)? onTapOutside;
  double? top;
  CustomSearchBar({super.key, this.onChanged, this.onTapOutside, this.top});

  @override
  Widget build(BuildContext context) {
    DarkmoodProv darkmood = DarkmoodProv();
    return Padding(
      padding: EdgeInsets.only(left: 10, top: top ?? 5.h),
      child: TextField(
        onTapOutside: onTapOutside,
        onChanged: onChanged,
        cursorColor: Colors.grey,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(7),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 1, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 1, color: Colors.grey)),
            hintText: "بحث",
            hintStyle: TextStyle(
              fontSize: 18,
            ),
            hintTextDirection: TextDirection.rtl,
            suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: darkmood.isDarkmood! ? Colors.white : Colors.black,
                ))),
      ),
    );
  }
}
