import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/CustomButton.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/Helpers/bottomSheet.dart';
import 'package:foodcon/Pages/Auth/OnboardingPage.dart';
import 'package:foodcon/Pages/Chef/chefMasterPage.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/Services/imagePicker.dart';
import 'package:foodcon/constants.dart';
import 'package:iconsax/iconsax.dart';
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

  String client = "User";
  String chef = "Chef";
  String userType = "User";

  @override
  Widget build(BuildContext context) {
    DarkmoodProv darkmood = DarkmoodProv();
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
                            child: FutureBuilder(
                                future: BottomSheetHelpers.futureProfilePic,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(snapshot.data!),
                                      radius: 60,
                                    );
                                  } else if (CustomImagePicker.profilePic !=
                                      null) {
                                    return CircleAvatar(
                                      backgroundImage: FileImage(
                                          CustomImagePicker.profilePic!),
                                      radius: 60,
                                    );
                                  } else {
                                    return CircleAvatar(
                                      radius: 60,
                                    );
                                  }
                                })),
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
                          BottomSheetHelpers(isProfielPic: true)
                              .imagePicker(context);
                        },
                        child: Container(
                          child: Icon(
                            Iconsax.camera,
                            color: Colors.grey,
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
                        borderColor: mainthemeColor(darkmood),
                        circular: 20,
                        txt: chef,
                        txtColor: userType == client
                            ? mainthemeColor(darkmood)
                            : Colors.white,
                        color: userType == client
                            ? fillFollowedColor(darkmood)
                            : mainthemeColor(darkmood),
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
                        borderColor: mainthemeColor(darkmood),
                        txtColor: userType == client
                            ? Colors.white
                            : mainthemeColor(darkmood),
                        circular: 20,
                        txt: client,
                        // txtColor: KprimaryColor,
                        onPressed: () {
                          setState(() {
                            userType = client;
                          });
                        },
                        color: userType == client
                            ? mainthemeColor(darkmood)
                            : fillFollowedColor(darkmood),
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
                    borderColor: mainthemeColor(darkmood),
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
                    color: mainthemeColor(darkmood),
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
