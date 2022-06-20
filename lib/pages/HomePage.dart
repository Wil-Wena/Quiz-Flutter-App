import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            "assets/pngtree-starry.jpg",
            fit: BoxFit.fill,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "Let's Play",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.purpleAccent, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Enter your instructions below",
                  style: TextStyle(color: Colors.purpleAccent),
                ),
                const Spacer(
                  flex: 1,
                ),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      //filled: true,
                      // fillColor: Color.fromARGB(255, 93, 128, 156),
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
                    onPressed: () {},
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
