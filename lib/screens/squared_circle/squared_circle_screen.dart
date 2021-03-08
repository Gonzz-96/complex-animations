import 'package:complex_animations/screens/squared_circle/squared_circle_animation.dart';
import 'package:flutter/material.dart';

class SquaredCircleScreen extends StatefulWidget {
  @override
  _SquaredCircleScreenState createState() => _SquaredCircleScreenState();
}

class _SquaredCircleScreenState extends State<SquaredCircleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2300),
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
    final size = MediaQuery.of(context).size;
    final squareSize = size.width * 0.34;
    final space = size.width * 0.02;

    return Scaffold(
      body: SquaredCircleAnimation(
        squareSize: squareSize,
        space: space,
        controller: controller,
      ),
    );
  }
}
