import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedContainerScreen(),
    );
  }
}

class AnimatedContainerScreen extends StatefulWidget {
  @override
  _AnimatedContainerScreenState createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedDitto(),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class AnimatedDitto extends StatefulWidget {
  @override
  _AnimatedDittoState createState() => _AnimatedDittoState();
}

class _AnimatedDittoState extends State<AnimatedDitto> {
  double dittoHeight = 100;
  double dittoWidth = 100;

  double margin = 0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      Timer.periodic(Duration(seconds: 1), (timer) {
        _changeOpacity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          transform: Matrix4.translationValues(0, margin, 0),
          curve: SineCurve(frequency: 5),
          height: dittoHeight,
          width: dittoWidth,
          color: Colors.purple,
          child: Image.asset('assets/ditto.png', fit: BoxFit.fill),
          duration: Duration(seconds: 10),
        ),
      ],
    );
  }

  void _changeOpacity() {
    setState(() {
      margin = -100;
    });
  }
}

class SineCurve extends Curve {
  final double frequency;

  SineCurve({this.frequency = 1});

  @override
  double transformInternal(double t) {
    return sin(2 * pi * frequency * t);
  }
}
