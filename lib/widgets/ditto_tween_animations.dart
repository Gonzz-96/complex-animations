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
      builder: (context, dynamic color, child) {
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
      builder: (context, dynamic color, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: child,
              color: color,
            ),
            TextButton(onPressed: _changeColor, child: Text('Animate'))
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

//
// FIGURE 3. Ditto's movement with custom tween.
//
class PointTweenDitto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Point>(
        begin: Point(0, 0),
        end: Point(200, 200),
      ),
      duration: Duration(seconds: 3),
      child: Image.asset('assets/ditto.png'),
      builder: (_, Point point, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: child!,
              bottom: point.y,
              left: point.x,
            )
          ],
        );
      },
    );
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  Point operator +(Point point) {
    return Point(this.x + point.x, this.y + point.y);
  }

  Point operator -(Point point) {
    return Point(this.x - point.x, this.y - point.y);
  }

  Point operator *(double scalar) {
    return Point(this.x * scalar, this.y * scalar);
  }
}
