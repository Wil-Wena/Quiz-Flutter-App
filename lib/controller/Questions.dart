// ignore_for_file: deprecated_member_use

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/classes/Question.dart';

//Animating the Progress Bar using GetxController

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  // ignore: prefer_final_fields, unused_field
  List<Question> _questions = data
      .map((e) => Question(
          id: e['id'],
          question: e['question'],
          options: e['options'],
          answer: e['index_of_answer']))
      .toList();

  List<Question> get questions => _questions;

  // ignore: prefer_final_fields
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  late int _selecAnswer;
  int get selecAnswer => this._selecAnswer;

  late int _numOfCorrectAnswers = 0;
  int get numOfCorrectAnswers => this._numOfCorrectAnswers;

  //Increments the question number
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  @override
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update(); //Works like setstate.
      });
    super.onInit();

    _animationController.forward(); //Starts the animation
  }

  //Function for checking the answer
  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true; // App begins once a question is answered
    _correctAnswer = question.answer;
    _selecAnswer = selectedIndex;

    if (_correctAnswer == _selecAnswer) {
      _numOfCorrectAnswers++;
    }
    _animationController.stop();
    update();
  }
}
