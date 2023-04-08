import 'package:flutter/material.dart';
import 'package:foodcon/Components/BorderdButton.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/Pages/Auth/SignUpPage.dart';
import 'package:foodcon/Pages/Client/clientMasterPage.dart';
import 'package:foodcon/Providers/DarkmoodProv.dart';
import 'package:foodcon/constants.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  String id = "Login";
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Validation() {
    FormState? form = formKey.currentState;
    if (form!.validate()) {
      print("qeqqwe");
      Navigator.of(context).pushReplacementNamed(ClientMasterPage().id);
    }
  }

  bool isSecured = true;
  @override
  Widget build(BuildContext context) {
    DarkmoodProv darkmood = DarkmoodProv();
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  Klogo,
                  height: 150,
                ),
                SizedBox(height: 50),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CostumTextField(
                        isRtl: false,
                        label: "Email",
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter your email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CostumTextField(
                        isRtl: false,
                        label: "Password",
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
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("you dont have an aacount? "),
                    GestureDetector(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignUpPage().id);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 6.h,
                  width: 80.w,
                  child: BorderdButton(
                    padding: 10,
                    borderColor: mainthemeColor(darkmood),
                    circular: 20,
                    txt: "Login",
                    txtColor: Colors.white,
                    color: mainthemeColor(darkmood),
                    onPressed: () {
                      Validation();
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/Auth/facebook.png",
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/Auth/google.png",
                        height: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
