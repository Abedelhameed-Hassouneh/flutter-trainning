import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz_app/data/questions.dart';
import 'package:simple_quiz_app/uiutils/results_box.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestartQuiz});

  final List<String> chosenAnswers;

  final void Function() onRestartQuiz;

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final totalQuestions = questions.length;
    final correctAnsweredQuestions = summary
        .where((element) => element['correct-answer'] == element['user-answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnsweredQuestions out of $totalQuestions questions correctly!',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ResultsBox(summary: summary),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: onRestartQuiz,
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple),
              child: const Text('Restart quiz'),
            )
          ],
        ),
      ),
    );
  }

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'index': (i + 1),
        'question': (questions[i].title),
        'correct-answer': (questions[i].answers[0]),
        'user-answer': (chosenAnswers[i])
      });
    }
    return summary;
  }
}
