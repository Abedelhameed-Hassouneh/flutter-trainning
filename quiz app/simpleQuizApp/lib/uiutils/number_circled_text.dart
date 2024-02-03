import 'package:flutter/material.dart';

class NumberCircledText extends StatelessWidget {
  const NumberCircledText(this.text, {super.key, required this.color});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(child: Text(text)),
    );
  }
}
