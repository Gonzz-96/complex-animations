import 'dart:math';

import 'package:flutter/material.dart';

const _curve = Curves.easeInOutCubic;

class SquaresAnimation extends StatelessWidget {
  final double size;
  final Animation<double> controller;

  SquaresAnimation(
    this.size,
    this.controller,
  )   : clockwiseCrossRotation = Tween(begin: 0.0, end: pi / 2).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.25, 0.50, curve: _curve),
          ),
        ),
        counterClockwiseCrossRotation = Tween(begin: 0.0, end: pi / 2).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.75, 1, curve: _curve),
          ),
        ),
        clockwiseSquaresRotation =
            Tween(begin: 0.0, end: -pi / 4 + 0.34).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.25, curve: _curve),
          ),
        ),
        counterClockwiseSquaresRotation =
            Tween(begin: 0.0, end: -pi / 4 + 0.34).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.50, 0.75, curve: _curve),
          ),
        );

  final Animation<double> clockwiseCrossRotation;
  final Animation<double> counterClockwiseCrossRotation;

  final Animation<double> clockwiseSquaresRotation;
  final Animation<double> counterClockwiseSquaresRotation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: clockwiseCrossRotation.value -
              counterClockwiseCrossRotation.value,
          child: _getWidgetTree(),
        );
      },
    );
  }

  Widget _getWidgetTree() {
    return Container(
      height: size,
      width: size,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final size = constraints.biggest;
          final squareSize = size.height / 2 - 2;
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Transform.rotate(
                  child: _Square(size: squareSize),
                  origin: Offset(-squareSize / 2, -squareSize / 2),
                  angle: clockwiseSquaresRotation.value -
                      counterClockwiseSquaresRotation.value,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Transform.rotate(
                  child: _Square(color: Colors.green, size: squareSize),
                  origin: Offset(squareSize / 2, -squareSize / 2),
                  angle: clockwiseSquaresRotation.value -
                      counterClockwiseSquaresRotation.value,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Transform.rotate(
                  child: _Square(size: squareSize, color: Colors.green),
                  origin: Offset(-squareSize / 2, squareSize / 2),
                  angle: clockwiseSquaresRotation.value -
                      counterClockwiseSquaresRotation.value,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Transform.rotate(
                  child: _Square(size: squareSize),
                  origin: Offset(squareSize / 2, squareSize / 2),
                  angle: clockwiseSquaresRotation.value -
                      counterClockwiseSquaresRotation.value,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Square extends StatelessWidget {
  final double size;
  final Color color;

  _Square({
    this.size = 100,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: Colors.white,
    );
  }
}
