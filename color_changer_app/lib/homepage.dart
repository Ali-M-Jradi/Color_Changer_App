import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int r = 0;
  int g = 0;
  int b = 0;
  void changeColor() {
    setState(() {
      r = Random().nextInt(256) + 1;
      g = Random().nextInt(256) + 1;
      b = Random().nextInt(256) + 1;
    });
  }

  int value = 0;
  Alignment begin = Alignment.topLeft;
  Alignment end = Alignment.bottomRight;
  String direction = "";
  void changeDirection() {
    setState(() {
      value = Random().nextInt(4) + 1;
      switch (value) {
        case 1:
          begin = Alignment.topLeft;
          end = Alignment.bottomRight;
          direction = "TopLeft to BottomRight";
          break;
        case 2:
          begin = Alignment.topRight;
          end = Alignment.bottomLeft;
          direction = "TopRight to BottomLeft";
          break;
        case 3:
          begin = Alignment.centerLeft;
          end = Alignment.centerRight;
          direction = "Horizontal";
          break;
        case 4:
          begin = Alignment.topCenter;
          end = Alignment.bottomCenter;
          direction = "Vertical";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(r, g, b, 1.0),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: [
              Color.fromRGBO(r, g, b, 1.0),
              Color.fromRGBO(r - 200, g - 200, b - 200, 1.0),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "R: $r, G: $g, B: $b",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => changeColor(),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("Change Color"),
              ),
              SizedBox(height: 20),
              Text("Direction: $direction"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => changeDirection(),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("Change Direction"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
