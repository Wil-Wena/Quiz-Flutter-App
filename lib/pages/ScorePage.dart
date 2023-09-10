// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/classes/ScoreAnimate.dart';
import 'package:quiz_app/controller/Questions.dart';
import 'package:quiz_app/pages/HomePage.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());

    return SafeArea(
      child: Stack(
        children: [
          Image(image: AssetImage('assets/orsrc43545.jpg')),
          const ScoreAnimation(),
          Center(
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Spacer(),
                  Text(
                    "Score: ${questionController.numOfCorrectAnswers * 10}% ",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.purpleAccent),
                  ),

                  SizedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionController.funCheck(),
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Colors.purpleAccent),
                    ),
                  )),
                  FlatButton(
                    onPressed: () {
                      Get.to(HomePage());
                    },
                    child: Text("Retry Quiz"),
                    color: Colors.white,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
