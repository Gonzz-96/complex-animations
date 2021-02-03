import 'dart:async';

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
  int currentIndex = 0;
  final dittoValues = [
    _DittoValues(100, 100, Colors.white),
    _DittoValues(400, 400, Colors.blue),
    _DittoValues(200, 200, Colors.purple),
    _DittoValues(300, 300, Colors.red),
    _DittoValues(100, 100, Colors.pink),
    _DittoValues(400, 400, Colors.green),
    _DittoValues(200, 200, Colors.cyan),
    _DittoValues(300, 300, Colors.orange),
  ];

  _DittoValues get currentValue => dittoValues[currentIndex];

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
          height: currentValue.dittoHeight,
          width: currentValue.dittoWidth,
          color: currentValue.containerColor,
          child: Image.asset('assets/ditto.png', fit: BoxFit.fill),
          duration: Duration(milliseconds: 500),
        ),
      ],
    );
  }

  void _changeOpacity() {
    setState(() {
      if (currentIndex == dittoValues.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
    });
  }
}

class _DittoValues {
  final double dittoHeight;
  final double dittoWidth;
  final Color containerColor;

  _DittoValues(this.dittoHeight, this.dittoWidth, this.containerColor);
}
