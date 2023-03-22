import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/ChangeProfilePic.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class EditprogilePage extends StatefulWidget {
  String id = 'EditprogilePage';
  EditprogilePage({super.key});

  @override
  State<EditprogilePage> createState() => _EditprogilePageState();
}

class _EditprogilePageState extends State<EditprogilePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Validation() {
    FormState? form = formKey.currentState;
    if (form!.validate()) {
      print("qeqqwe");
    }
  }

  String buttontxt = 'save';
  @override
  Widget build(BuildContext context) {
    var formKey;
    return Scaffold(
      appBar: AppBar(
        title: Text("Account info"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            changeProfilePic(),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    CostumTextField(
                      label: "Username",
                      initialValue: "Hegazy",
                      validator: (p0) {
                        if (p0!.length > 0) {
                          return null;
                        } else {
                          return "Enter your Username";
                        }
                      },
                    ),
                    CostumTextField(
                      label: "Address",
                      initialValue: "شارع العشريني",
                    ),
                  ],
                )),
            SizedBox(
              height: 22.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: BorderdButton(
                    padding: 10,
                    borderColor: KprimaryColor,
                    txtColor: Colors.white,
                    circular: 20,
                    txt: buttontxt,
                    // txtColor: KprimaryColor,
                    onPressed: () {
                      setState(() {
                        buttontxt = "saved";
                        Navigator.of(context).pop();
                      });
                    },
                    color: KprimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
