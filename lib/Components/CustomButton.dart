import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? txt;
  Function()? onPressed;
  EdgeInsetsGeometry? padding;
  Color? color;
  CustomButton({this.txt, this.onPressed, this.padding, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: padding, backgroundColor: color),
      onPressed: onPressed,
      child: Text(txt!),
    );
  }
}
