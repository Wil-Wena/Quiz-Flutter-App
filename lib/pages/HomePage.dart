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
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          //Image
          SizedBox(
            height: double.infinity,
            width: double.maxFinite,
            child: Image.asset(
              "assets/orsrc43545.jpg",
              fit: BoxFit.fill,
            ),
          ),

          //Move the body to a safe zone
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Quiz time Image
                Center(
                  child: Image.asset(
                    'assets/pngwing.com (6).png',
                    height: 200,
                    width: 300,
                  ),
                ),
                //First Text
                Text(
                  "Let's have Fun!",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.purpleAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),

                //Second Text
                const Text(
                  "Enter your name below",
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
                ),

                const Spacer(flex: 1), //Space between the text and TextField

                //TextField for name entry
                TextField(
                  controller: myController,
                  autocorrect: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      errorText: validate ? "Enter your name JON!!" : null,
                      errorStyle: TextStyle(color: Colors.white),
                      hintText: "Full Name",
                      hintStyle: const TextStyle(color: Colors.white),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const Spacer(),

                //Let's have have button
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
                    child: const Text("Start Quiz"),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
