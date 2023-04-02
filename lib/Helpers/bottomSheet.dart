import 'package:flutter/material.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BottomSheetHelpers {
  empty(setFun) {
    setFun(() {});
  }

  TextStyle itemsStyle = TextStyle(fontSize: 16.sp);
  TextStyle style = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold);
  imagePicker(context, setFun) {
    return showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Container(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.image,
                  ),
                  title: Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.camera,
                  ),
                  title: Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }));
  }

  date(context, {required int itemcount, required String type}) {
    List<bool> ChartMonthsselectedOptions = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];

    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        builder: ((context) {
          int _selectedIndex = 0;
          return Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    type,
                    style: style,
                  ),
                  Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "تأكيد",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 4.w,
                  ),
                ],
              ),
              Expanded(
                child: Consumer<FilterProv>(
                  builder: (context, val, child) => ListView.builder(
                    itemCount: itemcount,
                    itemBuilder: (context, index) => CheckboxListTile(
                      title: Text(
                        "${listfun(type)[index]}",
                        style: itemsStyle,
                      ),
                      value: ChartMonthsselectedOptions[index],
                      onChanged: (value) {
                        ChartMonthsselectedOptions[index] = value!;
                        val.refresh();
                        print(ChartMonthsselectedOptions);
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }

  List monsthsList = [
    'يناير',
    'فبراير',
    'مارس',
    'ابريل',
    'مايو',
    'يونيو',
    'يوليو',
    'اغسطس',
    'سبتمبر',
    'اكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];
  List yearsList = [
    2023,
    2024,
  ];
  List weeksList = [
    "الاول",
    "الثاني",
    "الثالث",
    "الرابع",
  ];
  listfun(String type) {
    List? value;
    switch (type) {
      case "الاشهر":
        value = monsthsList;
        break;
      case "السنين":
        value = yearsList;
        break;
      case "الاسابيع":
        value = weeksList;
        break;
      default:
    }
    return value;
  }
}
