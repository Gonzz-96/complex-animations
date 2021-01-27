import 'package:complex_animations/widgets/screens_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Complex Animations'),
          elevation: 5.0,
        ),
        body: ScreensList());
  }
}
