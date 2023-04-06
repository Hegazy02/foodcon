import 'package:flutter/material.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/constants.dart';

class CostumTextField extends StatelessWidget {
  DarkmoodProv darkmood = DarkmoodProv();
  String? label;
  String? hint;
  TextInputType? keyboardType;
  bool? secured;
  Widget? icon;
  Function()? onPressed;
  String? Function(String?)? validator;
  String? initialValue;
  bool? isRtl;
  Function(String)? onChanged;
  TextEditingController? controllers;
  CostumTextField(
      {this.label,
      this.hint,
      this.keyboardType,
      this.secured,
      this.icon,
      this.onPressed,
      this.validator,
      this.initialValue,
      this.isRtl,
      this.onChanged,
      this.controllers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        textDirection: isRtl == false ? TextDirection.ltr : TextDirection.rtl,
        initialValue: initialValue,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: darkmood.isDarkmood == false
                        ? KprimaryColor
                        : kDarksecondThemeColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey)),
            label: label != null ? Text(label!) : null,
            labelStyle: TextStyle(
                color: darkmood.isDarkmood == false
                    ? KprimaryColor
                    : kDarksecondThemeColor),
            hintText: hint,
            hintTextDirection: TextDirection.rtl,
            suffixIcon: icon == null
                ? icon
                : IconButton(
                    onPressed: onPressed ?? () {},
                    icon: icon!,
                    color: Colors.grey,
                  )),
        obscureText: secured ?? false,
        keyboardType: keyboardType ?? TextInputType.name,
        validator: validator,
        onChanged: onChanged,
        controller: controllers,
      ),
    );
  }
}
