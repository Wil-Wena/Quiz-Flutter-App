import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/Questions.dart';

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
          Center(
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Spacer(),
                  Text(
                    "Score: ${questionController.numOfCorrectAnswers}/${questionController.questions.length}",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.purpleAccent),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
