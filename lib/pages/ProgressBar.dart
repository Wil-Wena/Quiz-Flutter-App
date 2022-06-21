import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/Questions.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          // print(controller.animation.value);

          return Stack(children: [
            //To get access to the space in the first container

            LayoutBuilder(
                builder: ((context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gradient: LinearGradient(colors: [
                        Colors.purple,
                        Color.fromARGB(255, 206, 141, 218),
                      ]),
                    )))),

            //Clock bar
            Positioned(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${(controller.animation.value * 15).round()} seconds",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/pngwing.com (4).png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ))
          ]);
        },
      ),
    );
  }
}
