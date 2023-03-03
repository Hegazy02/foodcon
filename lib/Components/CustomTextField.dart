import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
  String? label;
  bool? secured;
  Widget? icon;
  Function()? onPressed;
  CostumTextField({this.label, this.secured, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(7)),
            label: Text(label!),
            suffixIcon: IconButton(
                onPressed: onPressed ?? () {}, icon: icon ?? Text(""))),
        obscureText: secured ?? false,
      ),
    );
  }
}
