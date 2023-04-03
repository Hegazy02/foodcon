import 'package:flutter/material.dart';
import 'package:foodcon/Providers/AddNewRecipePro.dart';
import 'package:provider/provider.dart';

class CustomDropdown extends StatelessWidget {
  String type;
  CustomDropdown({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    List<String>? defficultyLevel = ['سهلة', 'متوسطة', 'صعبة'];
    List<String>? amountList = [
      'نصف ملقعة صغيرة',
      'ملقعة صغيرة',
      'نصف ملقعة كبيرة',
      'ملقعة كبيرة',
      'نصف كوب كبير',
      'كوب كبير',
      'نصف كوب صغير',
      'كوب صغير',
    ];
    listFun({required String type}) {
      if (type == 'مقادير') {
        return amountList;
      } else {
        return defficultyLevel;
      }
    }

    return Consumer<AddNewRecipePro>(
      builder: (context, valprov, child) => DropdownButton(
        borderRadius: BorderRadius.circular(20),
        value: this.type == 'مقادير'
            ? valprov.amountValue
            : valprov.defficultyValue,
        items: listFun(type: this.type).map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          this.type == 'مقادير'
              ? valprov.amountValue = newValue
              : valprov.defficultyValue = newValue;
        },
      ),
    );
  }
}
