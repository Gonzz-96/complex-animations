import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ForeverSpinningDitto extends StatefulWidget {
  @override
  _ForeverSpinningDittoState createState() => _ForeverSpinningDittoState();
}

class _ForeverSpinningDittoState extends State<ForeverSpinningDitto> {
  double angle = 2 * pi;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // set timer
    timer = Timer.periodic(Duration(seconds: 5), _setNewAngle);
  }

  void _setNewAngle(Timer t) {
    setState(() {
      // change Ditto's angle
      angle += 2 * pi;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0, end: angle),
      duration: Duration(seconds: 5),
      builder: (_, num angle, child) {
        return Transform.rotate(
          angle: angle.toDouble(),
          child: Image.asset('assets/ditto.png'),
        );
      },
    );
  }
}

class DittoRotationTransition extends StatefulWidget {
  @override
  _DittoRotationTransitionState createState() =>
      _DittoRotationTransitionState();
}

class _DittoRotationTransitionState extends State<DittoRotationTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      child: Image.asset('assets/ditto.png'),
      turns: controller,
    );
  }
}
