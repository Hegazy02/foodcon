import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  Function(String)? onChanged;
  Function(PointerDownEvent)? onTapOutside;
  CustomSearchBar({super.key, this.onChanged, this.onTapOutside});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
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
                  color: Colors.black,
                ))),
      ),
    );
  }
}
