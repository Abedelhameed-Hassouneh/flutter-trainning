import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz_app/data/questions.dart';
import 'package:simple_quiz_app/uiutils/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onQuestionAnswered});

  final void Function(String) onQuestionAnswered;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  void answerQuestion(String answer) {
    widget.onQuestionAnswered(answer);

    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[questionIndex].title,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.white, fontSize: 23),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...questions[questionIndex].shuffledAnswers.map((e) {
              return AnswerButton(e, onPressed: () {
                answerQuestion(e);
              });
            })
          ],
        ),
      ),
    );
  }
}
