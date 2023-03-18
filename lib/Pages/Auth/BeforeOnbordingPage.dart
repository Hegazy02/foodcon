import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:foodcon/Pages/Auth/OnboardingPage.dart';
import 'package:foodcon/Pages/fullScreenCate.dart';
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
  String userType = "user";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Stack(
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
                    Positioned(
                      bottom: -10,
                      right: 32.w,
                      child: GestureDetector(
                        onTap: () async {
                          bottomSheet(context, setState);
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
                CostumTextField(
                  label: "Username",
                ),
                CostumTextField(
                  label: "Address",
                ),
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
                        txt: "Chef",
                        txtColor:
                            userType == 'user' ? KprimaryColor : Colors.white,
                        color:
                            userType == 'user' ? Colors.white : KprimaryColor,
                        onPressed: () {
                          setState(() {
                            userType = "chef";
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
                            userType == 'user' ? Colors.white : KprimaryColor,
                        circular: 20,
                        txt: "User",
                        // txtColor: KprimaryColor,
                        onPressed: () {
                          setState(() {
                            userType = "user";
                          });
                        },
                        color:
                            userType == 'user' ? KprimaryColor : Colors.white,
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
                      Navigator.of(context)
                          .pushReplacementNamed(OnBoardingPage().id);
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
