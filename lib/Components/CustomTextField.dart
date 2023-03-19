import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
  String? label;
  TextInputType? keyboardType;
  bool? secured;
  Widget? icon;
  Function()? onPressed;
 String? Function(String?)? validator;
  CostumTextField(
      {this.label, this.keyboardType, this.secured, this.icon, this.onPressed,this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            label: Text(label!),
            suffixIcon: IconButton(
                onPressed: onPressed ?? () {}, icon: icon ?? Text(""))),
        obscureText: secured ?? false,
        keyboardType: keyboardType ?? TextInputType.name,
        validator:validator ,
      ),
    );
  }
}
