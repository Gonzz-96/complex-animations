import 'dart:math';

import 'package:flutter/material.dart';

class SquaresAnimation extends StatelessWidget {
  final double size;

  const SquaresAnimation(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final size = constraints.biggest;
          final squareSize = size.height / 2 - 5;
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Transform.rotate(
                  child: _Square(size: squareSize),
                  origin: Offset(-squareSize / 2, -squareSize / 2),
                  angle: -pi / 4 + 0.34,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Transform.rotate(
                  child: _Square(color: Colors.green, size: squareSize),
                  origin: Offset(squareSize / 2, -squareSize / 2),
                  angle: -pi / 4 + 0.34,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Transform.rotate(
                  child: _Square(size: squareSize, color: Colors.green),
                  origin: Offset(-squareSize / 2, squareSize / 2),
                  angle: -pi / 4 + 0.34,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Transform.rotate(
                  child: _Square(size: squareSize),
                  origin: Offset(squareSize / 2, squareSize / 2),
                  angle: -pi / 4 + 0.34,
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
