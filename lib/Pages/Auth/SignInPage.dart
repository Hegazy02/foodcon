import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomButton.dart';
import 'package:foodcon/Components/CustomTextField.dart';
import 'package:foodcon/constants.dart';

class LoginPage extends StatefulWidget {
  String id = "Login";
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSecured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(height: 10,),
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
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        txt: "Login",
                        onPressed: () {},
                      ),
                    ),
                  ],
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
