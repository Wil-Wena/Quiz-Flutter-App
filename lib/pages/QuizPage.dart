// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/QuestionCard.dart';
import 'package:quiz_app/controller/Questions.dart';
import 'ProgressBar.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(
        QuestionController()); //To access our controller from Question Controller in the controller folder.
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        FlatButton(
          onPressed: () {},
          child: const Text(
            'Skip',
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              "assets/orsrc55974.png",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ProgressBar(),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(
                      () => Text.rich(
                        TextSpan(
                            text:
                                "Question ${questionController.questionNumber}",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: Colors.purpleAccent),
                            children: [
                              TextSpan(
                                text: "/${questionController.questions.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: Colors.purpleAccent,
                                        fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Divider(thickness: 3),
                  SizedBox(height: 20),

                  //Takes the whole height of the screen bottom
                  Expanded(
                    child: PageView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), //Prevents scrolling to next question.
                        controller: questionController.pageController,
                        onPageChanged: questionController.qNumberCount,
                        itemCount: questionController.questions.length,
                        itemBuilder: ((context, index) => QuestionCard(
                              question: questionController.questions[
                                  index], //Accessing the questions by their ids
                            ))),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      "Created by: Aballey Wilson",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
