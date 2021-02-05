import 'package:complex_animations/widgets/ditto_animations.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AnimatedOpacityDitto(),
          SizedBox(height: 30),
          AnimatedContainerDitto(),
          SizedBox(height: 30),
          AnimatedDecorationDitto(),
          SizedBox(height: 30),
          DancingDitto(),
          SizedBox(height: 30),
          CurvyDitto(),
          SizedBox(height: 30),
          SineDitto()
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
