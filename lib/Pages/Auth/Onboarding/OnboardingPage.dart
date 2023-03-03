import 'package:flutter/material.dart';
import 'package:foodcon/Components/CustomButton.dart';
import 'package:foodcon/constants.dart';

class OnBoardingPage extends StatefulWidget {
  String id = "OnBoaring";
  OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

int? currentIndex;

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 20,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: slides.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return slide(
                  count: index,
                );
              },
            ),
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Spacer(
                flex: 10,
              ),
              ...List.generate(
                slides.length,
                (index) => buildDot(index, context),
              ),
              Spacer(
                flex: 5,
              ),
              InkWell(
                onTap: () {
                  print("asd");
                },
                child: SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Skip"),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              )
            ]),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}

class slide extends StatelessWidget {
  int? count;
  slide({this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 1),
        Image.asset(
          slides[count!]['image'],
        ),
        Spacer(flex: 4),
        Text(
          slides[count!]['text'],
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}

List slides = [
  {
    "image": "assets/images/Onboarding/OnboardingProfile.png",
    "text": "Setup your profile"
  },
  {
    "image": "assets/images/Onboarding/OnboardingCooking.png",
    "text": "Cook and share your tasty recipes"
  },
  {
    "image": "assets/images/Onboarding/OnboardingChef.png",
    "text": "Be one of foodcon chefs"
  },
];

Container buildDot(int index, BuildContext context) {
  // Another Container returned
  return Container(
    height: 10,
    width: currentIndex == index ? 25 : 10,
    margin: EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: KprimaryColor,
    ),
  );
}
