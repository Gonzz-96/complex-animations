import 'package:flutter/material.dart';

//
// FIGURE 1. Ditto's animation using ColorTween
//
class StatelessColorTweenDitto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: ColorTween(begin: Colors.blueAccent, end: Colors.redAccent),
      duration: Duration(seconds: 2),
      builder: (context, color, child) {
        return Container(
          child: Image.asset('assets/ditto.png'),
          color: color,
        );
      },
    );
  }
}

//
// FIGURE 2.Ditto's animation using a StatefulWidget.
//
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
      child: Image.asset('assets/ditto.png'),
      builder: (context, color, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: child,
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
