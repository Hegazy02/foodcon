import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            label: label != null ? Text(label!) : null,
            hintText: hint,
            hintTextDirection: TextDirection.rtl,
            suffixIcon: icon == null
                ? icon
                : IconButton(onPressed: onPressed ?? () {}, icon: icon!)),
        obscureText: secured ?? false,
        keyboardType: keyboardType ?? TextInputType.name,
        validator: validator,
        onChanged: onChanged,
        controller: controllers,
      ),
    );
  }
}
