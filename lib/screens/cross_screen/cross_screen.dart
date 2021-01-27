import 'dart:math' as Math;

import 'package:complex_animations/screens/squared_circle/squares_animation.dart';
import 'package:complex_animations/widgets/squared_circle.dart';
import 'package:flutter/material.dart';

class CrossScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final squareSize = size.width * 0.34;
    final space = size.width * 0.02;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _CirclesCanvas(squareSize: squareSize, space: space),
          SquaresAnimation(squareSize)
        ],
      ),
    );
  }
}

class _CirclesCanvas extends StatelessWidget {
  const _CirclesCanvas({
    @required this.squareSize,
    @required this.space,
  });

  final double squareSize;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquaredCircle(
                squareSize: squareSize,
                rotationAngle: Math.pi / 2,
              ),
              SizedBox(width: space),
              SquaredCircle(
                squareSize: squareSize,
                rotationAngle: Math.pi,
              ),
            ],
          ),
          SizedBox(height: space),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquaredCircle(squareSize: squareSize, rotationAngle: 0),
              SizedBox(width: space),
              SquaredCircle(
                squareSize: squareSize,
                rotationAngle: 3 * Math.pi / 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
