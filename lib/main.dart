import 'package:complex_animations/screens/splash_screen.dart';
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
  int currentIndex = 0;
  final dittoValues = [
    _DittoValues(100, 100, Colors.white),
    _DittoValues(400, 400, Colors.blue),
    _DittoValues(200, 200, Colors.purple),
    _DittoValues(300, 300, Colors.red),
  ];

  _DittoValues get currentValue => dittoValues[currentIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedDitto(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _updateNewValues,
      //   child: Icon(Icons.chevron_right),
      // ),
      backgroundColor: Colors.white,
    );
  }
}

class AnimatedDitto extends StatefulWidget {
  @override
  _AnimatedDittoState createState() => _AnimatedDittoState();
}

class _AnimatedDittoState extends State<AnimatedDitto> {
  var dittoHeight = 100.0;
  var dittoWidth = 100.0;
  var backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          height: dittoHeight,
          width: dittoWidth,
          color: backgroundColor,
          child: Image.asset('assets/ditto.png', fit: BoxFit.fill),
          duration: Duration(seconds: 3),
        ),
        FlatButton(onPressed: _changeOpacity, child: Text('Animate'))
      ],
    );
  }

  void _changeOpacity() {
    setState(() {
      // new values to interpolate
      dittoWidth = 300;
      dittoHeight = 300;
      backgroundColor = Colors.deepPurpleAccent;
    });
  }
}

class _DittoValues {
  final double dittoHeight;
  final double dittoWidth;
  final Color containerColor;

  _DittoValues(this.dittoHeight, this.dittoWidth, this.containerColor);
}
