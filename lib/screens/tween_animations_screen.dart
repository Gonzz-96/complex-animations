import 'package:complex_animations/widgets/ditto_tween_animations.dart';
import 'package:flutter/material.dart';

class TweenAnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: size.height * 0.5,
            child: StatelessColorTweenDitto(),
          ),
          Container(
            height: size.height * 0.5,
            child: ColorTweenDitto(),
          ),
          Container(
            height: size.height * 0.5,
            child: PointTweenDitto(),
          ),
        ],
      ),
    );
  }
}
