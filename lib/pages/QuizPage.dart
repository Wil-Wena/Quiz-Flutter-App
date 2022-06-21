// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'ProgressBar.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Image.asset(
            "assets/pngtree-starry.jpg",
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProgressBar(),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                        text: "Question 1",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.purpleAccent),
                        children: [
                          TextSpan(
                            text: "/10",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    color: Colors.purpleAccent,
                                    fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  Divider(thickness: 3),
                  SizedBox(height: 20)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
