import 'package:flutter/material.dart';

class BorderdButton extends StatelessWidget {
  String? txt;
  Color? txtColor;
  Color? color;

  Color? borderColor;
  double? circular;
  Function()? onPressed;
  double? padding;

  BorderdButton(
      {required this.padding,
      this.txt,
      this.circular,
      this.borderColor,
      this.txtColor,
      this.onPressed,
      this.color});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(circular!),
                  border: Border.all(color: borderColor!)),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: padding!),
                  child: Text(
                    txt!,
                    style: TextStyle(color: txtColor ?? Colors.white),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
