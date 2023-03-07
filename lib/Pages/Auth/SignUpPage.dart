import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomButton.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/Pages/Auth/OnboardingPage.dart';
import 'package:foodcon/constants.dart';

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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
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
                  label: "Username",
                ),
                CostumTextField(
                  label: "Email",
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
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        txt: "Sign UP",
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(OnBoardingPage().id);
                        },
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ],
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
