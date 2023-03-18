import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomButton.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/Pages/Auth/BeforeOnbordingPage.dart';
import 'package:foodcon/Pages/Auth/OnboardingPage.dart';
import 'package:foodcon/Pages/fullScreenCate.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  Klogo,
                  height: 120,
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Sign UP",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                CostumTextField(
                  label: "Email",
                ),
                CostumTextField(
                  label: "Phone",
                  keyboardType: TextInputType.phone,
                ),
                CostumTextField(
                    label: "Password",
                    secured: isSecured,
                    icon: isSecured == false
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isSecured = !isSecured;
                      });
                    }),
                CostumTextField(
                    label: "Confirm Password",
                    secured: isConfirmSecured,
                    icon: isConfirmSecured == false
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isConfirmSecured = !isConfirmSecured;
                      });
                    }),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: BorderdButton(
                    padding: 10,
                    borderColor: KprimaryColor,
                    circular: 20,
                    txt: "Sign up",
                    txtColor: Colors.white,
                    color: KprimaryColor,
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(BeforeOnboardingPage().id);
                    },
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
