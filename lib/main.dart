import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'pages/HomePage.dart';
import 'pages/QuizPage.dart';
import 'pages/ScorePage.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
