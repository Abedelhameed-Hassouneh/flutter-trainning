import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, {super.key, required this.onPressed});

  final String answer;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
      child: Text(answer),
    );
  }
}
