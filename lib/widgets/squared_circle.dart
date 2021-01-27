import 'dart:math' as Math;

import 'package:flutter/material.dart';

class SquaredCircle extends StatelessWidget {
  final double squareSize;
  final double rotationAngle;
  final double sweepAngle;

  const SquaredCircle({
    @required this.squareSize,
    this.rotationAngle = 0,
    this.sweepAngle = Math.pi * 2,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle,
      child: Container(
        width: squareSize,
        height: squareSize,
        child: CustomPaint(
          painter: _SquaredCirclePainter(sweepAngle),
        ),
      ),
    );
  }
}

class _SquaredCirclePainter extends CustomPainter {
  final double sweepAngle;

  _SquaredCirclePainter(this.sweepAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2,
        ),
        0,
        sweepAngle,
      )
      ..lineTo(size.width / 2, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
