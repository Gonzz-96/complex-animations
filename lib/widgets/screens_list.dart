import 'package:complex_animations/screens/cross_screen/cross_screen.dart';
import 'package:complex_animations/screens/implicit_animations_screen.dart';
import 'package:complex_animations/screens/squared_circle/squared_circle_screen.dart';
import 'package:complex_animations/screens/tween_animations_screen.dart';
import 'package:complex_animations/widgets/screen_item.dart';
import 'package:flutter/material.dart';

class ScreensList extends StatelessWidget {
  final screens = {
    'Squared Circle': SquaredCircleScreen(),
    'Cross Animation': CrossScreen(),
    'Implicit Animations With Ditto :)': ImplicitAnimationsScreen(),
    'Tween Animations With Ditto :)': TweenAnimationsScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: screens.length,
      itemBuilder: (context, index) {
        final entry = screens.entries.toList()[index];
        return ScreenItem(
          entry: entry,
          shouldHaveDivider: index != screens.length - 1,
        );
      },
    );
  }
}
