import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isBatting = true;

int score = 0;

int ballCount = 6;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Mini Cricket",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage("assets/bat.jpeg"),
                    height: 180,
                    width: 180,
                  ),
                  Text(
                    "Runs",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    "$score",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(width: 20), // Space between the images

              Column(
                children: [
                  Image(
                    image: AssetImage("assets/ball.webp"),
                    height: 180,
                    width: 180,
                  ),
                  Text(
                    "Balls Left",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    "$ballCount",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ballCount == 0
              ? Column(
                  children: [
                    Text(
                      "Congrats! You got $score runs. 🎉",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Want to play again?",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                )
              : Text(""),
          SizedBox(
            height: 20,
          ),
          isBatting
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var randomScore = Random().nextInt(6);
                      if (ballCount <= 6 && ballCount > 0) {
                        score = score + randomScore;
                        ballCount--;
                      }
                      if (ballCount == 0) {
                        isBatting = false;
                      }
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 6, 55, 170)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.sports_cricket,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Bat",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      score = 0;
                      ballCount = 6;
                      isBatting = true;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Restart",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
