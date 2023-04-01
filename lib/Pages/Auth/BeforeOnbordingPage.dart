import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:foodcon/Pages/Auth/OnboardingPage.dart';
import 'package:foodcon/Pages/Chef/chefMasterPage.dart';
import 'package:foodcon/Services/imagePicker.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class BeforeOnboardingPage extends StatefulWidget {
  String id = "BeforeOnboardingPage";
  BeforeOnboardingPage({super.key});

  @override
  State<BeforeOnboardingPage> createState() => _BeforeOnboardingPageState();
}

class _BeforeOnboardingPageState extends State<BeforeOnboardingPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Validation() {
    FormState? form = formKey.currentState;
    if (form!.validate()) {
      print("qeqqwe");
      Navigator.of(context).pushReplacementNamed(OnBoardingPage().id);
    }
  }

  String client = "مستخدم";
  String chef = "شيف";
  String userType = "مستخدم";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: image == null
                              ? CircleAvatar(
                                  radius: 60,
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(image!),
                                  radius: 60,
                                ),
                        ),
                        SizedBox(
                          height: 2.h,
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 32.w,
                      child: GestureDetector(
                        onTap: () async {
                          BottomSheetHelpers().imagePicker(context, setState);
                        },
                        child: Container(
                          child: Icon(
                            Icons.photo_camera,
                            // color: KprimaryColor,
                            size: 32,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 5,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  35,
                                ),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(2, 4),
                                  color: Colors.black.withOpacity(
                                    0.3,
                                  ),
                                  blurRadius: 3,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CostumTextField(
                          label: "Username",
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
                        ),
                      ],
                    )),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 6.h,
                      width: 30.w,
                      child: BorderdButton(
                        padding: 10,
                        borderColor: KprimaryColor,
                        circular: 20,
                        txt: chef,
                        txtColor:
                            userType == client ? KprimaryColor : Colors.white,
                        color:
                            userType == client ? Colors.white : KprimaryColor,
                        onPressed: () {
                          setState(() {
                            userType = chef;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                      width: 30.w,
                      child: BorderdButton(
                        padding: 10,
                        borderColor: KprimaryColor,
                        txtColor:
                            userType == client ? Colors.white : KprimaryColor,
                        circular: 20,
                        txt: client,
                        // txtColor: KprimaryColor,
                        onPressed: () {
                          setState(() {
                            userType = client;
                          });
                        },
                        color:
                            userType == client ? KprimaryColor : Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 27.h,
                ),
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: BorderdButton(
                    padding: 10,
                    borderColor: KprimaryColor,
                    txtColor: Colors.white,
                    circular: 20,
                    txt: "Continue",
                    // txtColor: KprimaryColor,
                    onPressed: () {
                      // Validation();
                      if (userType == client) {
                        Navigator.of(context)
                            .pushReplacementNamed(OnBoardingPage().id);
                      } else {
                        print("new chef added");
                        Navigator.of(context)
                            .pushReplacementNamed(ChefMasterPage().id);
                      }
                    },
                    color: KprimaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
