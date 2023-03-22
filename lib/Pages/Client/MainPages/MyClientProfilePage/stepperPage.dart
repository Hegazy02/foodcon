import 'package:flutter/material.dart';
import 'package:foodcon/constants.dart';

import 'package:easy_stepper/easy_stepper.dart';

class StepperPage extends StatefulWidget {
  String id = "stepperPage";
  StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  @override
  Widget build(BuildContext context) {
    int activeStep = 3;
    return Scaffold(
      appBar: AppBar(
        title: Text("Track"),
      ),
      body: EasyStepper(
        direction: Axis.vertical,
        defaultStepBorderType: BorderType.normal,
        lineColor: KprimaryColor,
        enableStepTapping: false,
        activeStep: activeStep,
        lineLength: 70,
        stepShape: StepShape.rRectangle,
        stepBorderRadius: 15,
        borderThickness: 2,
        padding: 20,
        stepRadius: 28,
        finishedStepBorderColor: KprimaryColor,
        finishedStepTextColor: KprimaryColor,
        finishedStepBackgroundColor: KprimaryColor,
        activeStepIconColor: KprimaryColor,
        // loadingAnimation: 'assets/loading_circle.json',
        steps: const [
          EasyStep(
            icon: Icon(Icons.add_task_rounded),
            title: 'Order Placed',
          ),
          EasyStep(
            icon: Icon(Icons.done),
            title: 'Chef acception',
          ),
          EasyStep(
            icon: Icon(Icons.dinner_dining),
            title: 'Preparing',
          ),
          EasyStep(
            icon: Icon(Icons.delivery_dining),
            title: 'On The Way',
          ),
          EasyStep(
            icon: Icon(Icons.check_circle_outline_outlined),
            title: 'Delivered',
          ),
        ],
        onStepReached: (index) => setState(() => activeStep = index),
      ),
    );
  }
}
