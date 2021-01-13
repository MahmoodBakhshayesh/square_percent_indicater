import 'dart:async';

import 'package:flutter/material.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int value = 0;
  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 20), (Timer t) {
      setState(() {
        value = (value + 1) % 100;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SquarePercentIndicator(
          width: 140,
          height: 140,
          startAngle: StartAngle.bottomRight,
          reverse: true,
          borderRadius: 12,
          shadowWidth: 1.5,
          progressWidth: 4,
          shadowColor: Colors.grey,
          progressColor: Colors.blue,
          progress: value / 100,
          child: Center(
              child: Text(
                "$value %",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
        ),
      ),
    );
  }
}
