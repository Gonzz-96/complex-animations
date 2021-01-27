import 'dart:math' as Math;

import 'package:complex_animations/widgets/squared_circle.dart';
import 'package:flutter/material.dart';

const _curve = Curves.easeInOutCubic;

class SquaredCircleAnimation extends StatelessWidget {
  final double squareSize;
  final double space;
  final Animation<double> controller;

  SquaredCircleAnimation({
    @required this.squareSize,
    @required this.space,
    @required this.controller,
  })  : _counterClockwiseRotation =
            Tween(begin: 0.0, end: -Math.pi / 2).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.5, curve: _curve),
          ),
        ),
        _clockwiseRotation = Tween(begin: 0.0, end: Math.pi / 2).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: _curve),
          ),
        ),
        _squaredCircleIndividualRotation =
            Tween(begin: 0.0, end: -2 * Math.pi).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: _curve),
          ),
        );

  // animations
  final Animation<double> _counterClockwiseRotation;
  final Animation<double> _clockwiseRotation;
  final Animation<double> _squaredCircleIndividualRotation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _getWidgetTree);
  }

  Widget _getWidgetTree(BuildContext context, Widget child) {
    return Transform.rotate(
      angle: _counterClockwiseRotation.value + _clockwiseRotation.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquaredCircle(
                sweepAngle: Math.pi * 1.5,
                squareSize: squareSize,
                rotationAngle:
                    Math.pi / 2 + _squaredCircleIndividualRotation.value,
              ),
              SizedBox(width: space),
              SquaredCircle(
                sweepAngle: Math.pi * 1.5,
                squareSize: squareSize,
                rotationAngle: Math.pi + _squaredCircleIndividualRotation.value,
              ),
            ],
          ),
          SizedBox(height: space),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquaredCircle(
                sweepAngle: Math.pi * 1.5,
                squareSize: squareSize,
                rotationAngle: _squaredCircleIndividualRotation.value,
              ),
              SizedBox(width: space),
              SquaredCircle(
                sweepAngle: Math.pi * 1.5,
                squareSize: squareSize,
                rotationAngle:
                    3 * Math.pi / 2 + _squaredCircleIndividualRotation.value,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
