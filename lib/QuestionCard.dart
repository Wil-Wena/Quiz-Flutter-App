// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/OptionPane.dart';
import 'package:quiz_app/classes/Question.dart';
import 'package:quiz_app/controller/Questions.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Expanded(
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(height: 10),
            //Options container area
            ...List.generate(
                question.options.length,
                (index) => OptionPane(
                    text: question.options[index],
                    index: index,
                    press: () {
                      _controller.checkAnswer(question, index);
                    }))
          ],
        ),
      ),
    );
  }
}
