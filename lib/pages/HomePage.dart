import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/pages/QuizPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();
  bool validate = false;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(myController.text);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.maxFinite,
            child: Image.asset(
              "assets/orsrc43545.jpg",
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/pngwing.com (6).png',
                    height: 200,
                    width: 300,
                  ),
                ),
                Text(
                  "Let's have Fun!",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.purpleAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const Text(
                  "Enter your name below",
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
                ),
                const Spacer(
                  flex: 1,
                ),
                TextField(
                  controller: myController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      errorText: validate ? "Enter your name JON!!" : null,
                      hintText: "Full Name",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Colors.purple,
                        Color.fromARGB(255, 206, 141, 218)
                      ]),
                      borderRadius: BorderRadius.circular(12)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      primary: Colors.purpleAccent,
                      minimumSize: const Size(500, 50),
                    ),
                    onPressed: () {
                      setState(() {
                        if (validate = myController.text.isEmpty) {
                        } else {
                          Get.to(QuizPage());
                        }
                      });
                    },
                    child: const Text("Let's start the quiz"),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
