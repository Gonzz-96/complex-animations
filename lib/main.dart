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
      home: SplashScreen(),
    );
  }
}

class CustomImplicitAnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ColorTweenDitto()),
    );
  }
}

class ColorTweenDitto extends StatefulWidget {
  @override
  _ColorTweenDittoState createState() => _ColorTweenDittoState();
}

class _ColorTweenDittoState extends State<ColorTweenDitto> {
  Color _backgroundColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: ColorTween(begin: Colors.blueAccent, end: _backgroundColor),
      duration: Duration(seconds: 2),
      builder: (context, color, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/ditto.png'),
              color: color,
            ),
            FlatButton(onPressed: _changeColor, child: Text('Animate'))
          ],
        );
      },
    );
  }

  void _changeColor() {
    setState(() {
      _backgroundColor = _backgroundColor == Colors.blueAccent
          ? Colors.redAccent
          : Colors.blueAccent;
    });
  }
}
