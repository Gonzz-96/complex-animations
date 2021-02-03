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
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutCubic,
          color: currentValue.containerColor,
          width: currentValue.dittoWidth,
          height: currentValue.dittoHeight,
          child: Image.asset('assets/ditto.png', fit: BoxFit.fill),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateNewValues,
        child: Icon(Icons.chevron_right),
      ),
      backgroundColor: Colors.white,
    );
  }

  void _updateNewValues() {
    setState(() {
      if (currentIndex == dittoValues.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex += 1;
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
