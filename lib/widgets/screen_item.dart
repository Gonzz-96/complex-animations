import 'package:complex_animations/screens/squared_circle/squared_circle_screen.dart';
import 'package:flutter/material.dart';

class ScreenItem extends StatelessWidget {
  const ScreenItem({
    @required this.entry,
    this.shouldHaveDivider = false,
  });

  final MapEntry<String, SquaredCircleScreen> entry;
  final bool shouldHaveDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => entry.value));
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                trailing: Icon(Icons.chevron_right),
                title: Text(
                  entry.key,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (shouldHaveDivider)
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          )
      ],
    );
  }
}
