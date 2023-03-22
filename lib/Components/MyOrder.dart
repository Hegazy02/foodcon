import 'package:flutter/material.dart';
import 'package:foodcon/constants.dart';

class MyOrder extends StatelessWidget {
  int index;
  int items;
  int price;

  String image;
  String title;
  String chefName;
  String ButtonTxt;
  Function() onButtonPressed;
  Function()? onTap;

  MyOrder(
      {required this.image,
      required this.index,
      required this.items,
      required this.ButtonTxt,
      required this.onButtonPressed,
      required this.price,
      required this.title,
      required this.chefName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        image: AssetImage(image), fit: BoxFit.fill)),
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${items} items | ${chefName}",
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
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40)),
            onPressed: onButtonPressed,
            child: Text(ButtonTxt))
      ],
    );
  }
}
