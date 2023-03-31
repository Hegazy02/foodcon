import 'package:flutter/material.dart';
import 'package:foodcon/Models/RecipeModel.dart';
import 'package:foodcon/constants.dart';

class MyOrder extends StatelessWidget {
  bool isTwoButtons;
  int items;
  int price;
  RecipeModel recipe;
  String ButtonTxt;
  Function() onButtonPressed;
  Function()? onCancelButton;
  Function()? onTap;

  MyOrder(
      {required this.isTwoButtons,
      required this.recipe,
      required this.items,
      required this.ButtonTxt,
      required this.onButtonPressed,
      this.onCancelButton,
      required this.price,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    OutlinedBorder? buttonStyle = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                SizedBox(
                  width: 7,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("${recipe.image}"),
                          fit: BoxFit.fill)),
                ),
                Spacer(
                  flex: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${recipe.title}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${items} items | ${recipe.chefName}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$${price}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: KprimaryColor,
                          fontSize: 16),
                    ),
                  ],
                ),
                Spacer(
                  flex: 7,
                ),
              ],
            ),
          ),
          isTwoButtons == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: buttonStyle,
                            padding: EdgeInsets.symmetric(horizontal: 40)),
                        onPressed: onCancelButton,
                        child: Text("ارفض")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: buttonStyle,
                            padding: EdgeInsets.symmetric(horizontal: 40)),
                        onPressed: onButtonPressed,
                        child: Text(ButtonTxt)),
                  ],
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: buttonStyle,
                      padding: EdgeInsets.symmetric(horizontal: 40)),
                  onPressed: onButtonPressed,
                  child: Text(ButtonTxt)),
        ],
      ),
    );
  }
}
