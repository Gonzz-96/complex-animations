import 'package:flutter/material.dart';

class Rectangle extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;

  Rectangle({
    this.width = 100,
    this.height = 100,
    this.size = 100,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
    );
  }
}
