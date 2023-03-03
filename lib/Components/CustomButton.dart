import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? txt;
  Function()? onPressed;
  CustomButton({this.txt, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding:
              MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15))),
      onPressed: onPressed,
      child: Text(txt!),
    );
  }
}
