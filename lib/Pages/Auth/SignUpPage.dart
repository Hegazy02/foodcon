import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Pages/Auth/BeforeOnbordingPage.dart';
import 'package:foodcon/Pages/Auth/SignInPage.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  String id = "SignUp";
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSecured = true;
  bool isConfirmSecured = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Validation() {
    FormState? form = formKey.currentState;
    if (form!.validate()) {
      print("Signed Up");
      Navigator.of(context).pushReplacementNamed(BeforeOnboardingPage().id);
    }
  }

  @override
  Widget build(BuildContext context) {
    DarkmoodProv darkmood = DarkmoodProv();
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  Klogo,
                  height: 14.h,
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  "Sign UP",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CostumTextField(
                        label: "Email",
                        isRtl: false,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter your email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CostumTextField(
                        label: "Phone",
                        isRtl: false,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter your Phone number";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CostumTextField(
                        label: "Password",
                        isRtl: false,
                        secured: isSecured,
                        icon: isSecured == false
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isSecured = !isSecured;
                          });
                        },
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter your password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CostumTextField(
                        label: "Confirm Password",
                        isRtl: false,
                        secured: isConfirmSecured,
                        icon: isConfirmSecured == false
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isConfirmSecured = !isConfirmSecured;
                          });
                        },
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Confirm your password";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("you already have an aacount? "),
                    GestureDetector(
                      child: Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginPage().id);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: BorderdButton(
                    padding: 10,
                    borderColor: mainthemeColor(darkmood),
                    circular: 20,
                    txt: "Sign up",
                    txtColor: Colors.white,
                    color: mainthemeColor(darkmood),
                    onPressed: () {
                      // Validation();
                      Navigator.of(context)
                          .pushReplacementNamed(BeforeOnboardingPage().id);
                    },
                  ),
                ),
                SizedBox(
                  height: 6.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
