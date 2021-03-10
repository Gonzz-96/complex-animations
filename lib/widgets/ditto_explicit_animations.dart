import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

//
// Figure 1. Forever spinning Ditto.
//
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

//
// Figure 2. RotationTransitionDitto in action.
//
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
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _stopOrStartAnimation() {
    if (controller.isAnimating) {
      controller.stop();
    } else {
      controller.repeat();
    }
  }

  void _invertAnimationDirection() {
    if (controller.status == AnimationStatus.reverse) {
      controller.repeat();
    } else if (controller.status == AnimationStatus.forward) {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _stopOrStartAnimation,
      onLongPress: _invertAnimationDirection,
      child: RotationTransition(
        child: Image.asset('assets/ditto.png'),
        turns: controller,
      ),
    );
  }
}

//
// Figure 3 and 4.
//
class DittoSlideTransition extends StatefulWidget {
  @override
  _DittoSlideTransitionState createState() => _DittoSlideTransitionState();
}

class _DittoSlideTransitionState extends State<DittoSlideTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    offsetAnimation = Tween(
      begin: Offset.zero,
      end: Offset(0.0, 1.5),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      child: Image.asset('assets/ditto.png'),
      position: offsetAnimation,
    );
  }
}
