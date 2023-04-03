import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomButton.dart';
import 'package:foodcon/Components/CustomDropDown.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/Global/textStyle.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:foodcon/Providers/AddNewRecipePro.dart';
import 'package:foodcon/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AddNewRecipePage extends StatefulWidget {
  const AddNewRecipePage({super.key});

  @override
  State<AddNewRecipePage> createState() => _AddNewRecipePageState();
}

class _AddNewRecipePageState extends State<AddNewRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: KAppBarShape,
        title: Text(
          "اضافة وصفة جديده",
          style: appBarStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "اسم الوصفة",
                  style: mainTextStyle,
                ),
              ],
            ),
            CostumTextField(
              isRtl: true,
              hint: "اسم الوصفة",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "صورة الوصفة",
                  style: mainTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 10.w,
                  child: CustomButton(
                    child: Icon(Iconsax.image),
                    onPressed: () async {
                      await BottomSheetHelpers(isProfielPic: false)
                          .imagePicker(context);
                      setState(() {});
                    },
                    padding: EdgeInsets.symmetric(horizontal: 1),
                  ),
                ),
              ],
            ),
            FutureBuilder(
                future: BottomSheetHelpers.futureRecipe,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 150,
                      width: 70.w,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: FileImage(snapshot.data!),
                              fit: BoxFit.fill)),
                    );
                  } else {
                    return SizedBox();
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "نبذه عنها",
                  style: mainTextStyle,
                ),
              ],
            ),
            CostumTextField(
              isRtl: true,
              hint: "نبذه عنها",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "المقادير",
                  style: mainTextStyle,
                ),
              ],
            ),
            Consumer<AddNewRecipePro>(
              builder: (context, valProv, child) => ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: valProv.ingredientsNumbers.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    CostumTextField(
                      isRtl: true,
                      hint: "الصنف",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 10.w,
                          child: CustomButton(
                            child: Icon(Icons.delete),
                            onPressed: () {
                              valProv.removeingredientsNumbers = index;
                            },
                            padding: EdgeInsets.symmetric(horizontal: 1),
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                          child: CostumTextField(
                            keyboardType: TextInputType.number,
                            isRtl: true,
                            hint: "عدد المرات",
                          ),
                        ),
                        CustomDropdown(type: 'مقادير'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Consumer<AddNewRecipePro>(
              builder: (context, valProv, child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: CustomButton(
                  child: Text("اضافة مكون"),
                  onPressed: () {
                    valProv.AddingredientsNumbers = true;
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "طريقة التحضير",
                  style: mainTextStyle,
                ),
              ],
            ),
            Consumer<AddNewRecipePro>(
                builder: (context, valProv, child) => ListView.builder(
                      itemCount: valProv.processNumbers.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 10.w,
                            child: CustomButton(
                              child: Icon(Icons.delete),
                              onPressed: () {
                                valProv.removeprocessNumbers = index;
                              },
                              padding: EdgeInsets.symmetric(horizontal: 1),
                            ),
                          ),
                          SizedBox(
                            width: 75.w,
                            child: CostumTextField(
                              isRtl: true,
                              hint: "العملية",
                            ),
                          ),
                        ],
                      ),
                    )),
            Consumer<AddNewRecipePro>(
              builder: (context, valProv, child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: CustomButton(
                  child: Text("اضافة عملية"),
                  onPressed: () {
                    valProv.AddprocessNumbers = true;
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "وقت التحضير ومستوى الصعوبة",
                  style: mainTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 27.w,
                  child: CostumTextField(
                    keyboardType: TextInputType.number,
                    isRtl: true,
                    hint: "الوقت بالدقائق",
                  ),
                ),
                CustomDropdown(type: 'q'),
              ],
            ),
            CustomButton(
              child: Text("انشاء الوصفة"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
