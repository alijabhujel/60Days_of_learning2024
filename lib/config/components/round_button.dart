import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const RoundButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        child: Center(child: Text(title)),
        decoration: BoxDecoration(color: Colors.blue),
      ),
    );
  }
}
