import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodcon/Providers/FilterProv.dart';
import 'package:foodcon/Services/imagePicker.dart';
import 'package:foodcon/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BottomSheetHelpers {
  bool isProfielPic;
  static Future<File?>? futureRecipe;
  static Future<File?>? futureProfilePic;
  BottomSheetHelpers({required this.isProfielPic});

  TextStyle itemsStyle = TextStyle(fontSize: 16.sp);
  TextStyle style = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold);
  CustomImagePicker pick = CustomImagePicker();
  imagePicker(context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        context: context,
        builder: ((context) {
          return Container(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  trailing: Icon(
                    Iconsax.gallery,
                    color: KprimaryColor,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("المعرض"),
                    ],
                  ),
                  onTap: () {
                    if (isProfielPic) {
                      futureProfilePic =
                          pick.photofromGallery(context: context);
                      Navigator.pop(context);
                    } else {
                      futureRecipe = pick.photofromGallery(context: context);
                      Navigator.pop(context);
                    }
                  },
                ),
                ListTile(
                  trailing: Icon(
                    Iconsax.camera,
                    color: KprimaryColor,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("الكاميرا"),
                    ],
                  ),
                  onTap: () async {
                    if (isProfielPic) {
                      futureProfilePic = pick.photofromCamera(context: context);
                      Navigator.pop(context);
                    } else {
                      futureRecipe = pick.photofromCamera(context: context);
                    }

                    Navigator.pop(context);
                    print("qweqweqweqweqweqweqwe");
                  },
                ),
              ],
            ),
          );
        }));
  }

  date({context, required int itemcount, required String type}) {
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

  workingDays(context, {List? days}) {
    List<bool> defaultDays = [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
    ];
    List myList = days ?? defaultDays;
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        builder: ((context) {
          return Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "ايام العمل",
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
                    itemCount: 7,
                    itemBuilder: (context, index) => CheckboxListTile(
                      title: Text(
                        "${daysList[index]}",
                        style: itemsStyle,
                      ),
                      value: myList[index],
                      onChanged: (value) {
                        myList[index] = value!;
                        val.refresh();
                        print(myList);
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

List daysList = [
  "السبت",
  "الاحد",
  "الاثنين",
  "الثلائاء",
  "الاربع",
  "الخميس",
  "الجمعه",
];
