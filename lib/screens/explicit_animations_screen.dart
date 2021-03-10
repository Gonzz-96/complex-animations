import 'package:complex_animations/widgets/ditto_explicit_animations.dart';
import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DittoSlideTransition(),
      ),
    );
  }
}
