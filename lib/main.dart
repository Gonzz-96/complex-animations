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
  double dittoHeight = 100;
  double dittoWidth = 100;

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
          curve: Curves.easeIn,
          height: dittoHeight,
          width: dittoWidth,
          color: Colors.purple,
          child: Image.asset('assets/ditto.png', fit: BoxFit.fill),
          duration: Duration(milliseconds: 800),
        ),
      ],
    );
  }

  void _changeOpacity() {
    setState(() {
      dittoHeight = 400;
      dittoWidth = 400;
    });
  }
}

class _DittoValues {
  final double dittoHeight;
  final double dittoWidth;
  final Color containerColor;

  _DittoValues(this.dittoHeight, this.dittoWidth, this.containerColor);
}
