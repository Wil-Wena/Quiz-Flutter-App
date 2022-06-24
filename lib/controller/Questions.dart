// ignore_for_file: deprecated_member_use

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/classes/Question.dart';
import 'package:quiz_app/pages/ScorePage.dart';

//Animating the Progress Bar using GetxController

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

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
  //Implementation of Progress Bar animation
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update(); //Works like setstate.
      });
    super.onInit();

    _animationController
        .forward()
        .whenComplete(() => nextQuestion()); //Starts the animation

    _pageController = PageController(); //Page controller Initialized.
  }

//Closure of controller
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  //Function for moving to the next question
  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 800), curve: Curves.ease);

      _animationController.reset(); //Reset the counter
      _animationController
          .forward()
          .whenComplete(() => nextQuestion()); //Starts the counter again.
    } else {
      Get.to(ScorePage());
    }
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

    //Controls the time the page switches to the next question
    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  //Function to count the question number
  void qNumberCount(int index) {
    _questionNumber.value = index + 1;
  }

  String funCheck() {
    if (numOfCorrectAnswers == questions.length) {
      return "Wab3n herrh! Congrats!!!";
    } else if (numOfCorrectAnswers == questions.length / 2) {
      return "You had not too much fun";
    } else if (numOfCorrectAnswers < questions.length / 2) {
      return "You had litte fun";
    }
    return "You had fun";
  }
}
