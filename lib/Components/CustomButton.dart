import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Widget? child;
  Function()? onPressed;
  EdgeInsetsGeometry? padding;
  Color? color;
  CustomButton({required this.child, this.onPressed, this.padding, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
