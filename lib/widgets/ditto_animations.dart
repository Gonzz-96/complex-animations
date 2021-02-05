import 'dart:async';

import 'package:flutter/material.dart';

//
// FIGURE 1. Animated Ditto's Opacity
//
class AnimatedOpacityDitto extends StatefulWidget {
  @override
  _AnimatedOpacityDittoState createState() => _AnimatedOpacityDittoState();
}

class _AnimatedOpacityDittoState extends State<AnimatedOpacityDitto> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.52,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: AnimatedOpacity(
              child: Image.asset('assets/ditto.png',
                  fit: BoxFit.fill), // <--- The child
              duration: Duration(seconds: 3), // <-- The duration
              opacity: opacity, // <-- The value
            ),
          ),
          FlatButton(onPressed: _changeOpacity, child: Text('Animate'))
        ],
      ),
    );
  }

  void _changeOpacity() {
    setState(() {
      opacity = 1.0;
    });
  }
}

//
// FIGURE 2. Multiple animated properties on Ditto.
//
class AnimatedContainerDitto extends StatefulWidget {
  @override
  _AnimatedContainerDittoState createState() => _AnimatedContainerDittoState();
}

class _AnimatedContainerDittoState extends State<AnimatedContainerDitto> {
  var dittoHeight = 100.0;
  var dittoWidth = 100.0;
  var backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: AnimatedContainer(
              height: dittoHeight,
              width: dittoWidth,
              color: backgroundColor,
              child: Image.asset('assets/ditto.png', fit: BoxFit.fill),
              duration: Duration(seconds: 3),
            ),
          ),
          FlatButton(onPressed: _changeOpacity, child: Text('Animate'))
        ],
      ),
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

//
// FIGURE 3. Animated decoration property.
//
class AnimatedDecorationDitto extends StatefulWidget {
  @override
  _AnimatedDecorationDittoState createState() =>
      _AnimatedDecorationDittoState();
}

class _AnimatedDecorationDittoState extends State<AnimatedDecorationDitto> {
  var borderRadius = 0.0;
  var backgroundColor = Colors.yellow;
  var dittoHeight = 100.0;
  var dittoWidth = 100.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      child: Column(
        children: [
          AnimatedContainer(
            height: dittoHeight,
            width: dittoWidth,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Image.asset('assets/ditto.png', fit: BoxFit.fill),
            duration: Duration(seconds: 3),
          ),
          FlatButton(onPressed: _changeOpacity, child: Text('Animate'))
        ],
      ),
    );
  }

  void _changeOpacity() {
    setState(() {
      // new values to interpolate
      backgroundColor = Colors.deepPurple;
      borderRadius = 150.0;
      dittoWidth = 300;
      dittoHeight = 300;
    });
  }
}

//
// FIGURE 4. Ditto choreography.
//
class DancingDitto extends StatefulWidget {
  @override
  _DancingDittoState createState() => _DancingDittoState();
}

class _DancingDittoState extends State<DancingDitto> {
  Timer periodicTimer;
  Timer timer;

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
    timer = Timer(Duration(milliseconds: 500), () {
      periodicTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        _changeOpacity();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    periodicTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      child: Column(
        children: [
          AnimatedContainer(
            height: currentValue.dittoHeight,
            width: currentValue.dittoWidth,
            color: currentValue.containerColor,
            child: Image.asset('assets/ditto.png', fit: BoxFit.fill),
            duration: Duration(milliseconds: 500),
          ),
        ],
      ),
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
