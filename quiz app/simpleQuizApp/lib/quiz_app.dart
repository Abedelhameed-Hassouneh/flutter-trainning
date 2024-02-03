import 'package:flutter/material.dart';
import 'package:simple_quiz_app/data/questions.dart';
import 'package:simple_quiz_app/ui/landing/landing_screen.dart';
import 'package:simple_quiz_app/ui/questions/questions_screen.dart';
import 'package:simple_quiz_app/ui/quizresults/results_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  String selectedScreen = 'landing-screen';
  List<String> userAnswers = [];

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: _getSelectedScreen(),
        ),
      ),
    );
  }

  void questionsScreenRedirection() {
    setState(() {
      selectedScreen = 'questions-screen';
    });
  }

  void answerQuestion(String answer) {
    userAnswers.add(answer);

    if (questions.length == userAnswers.length) {
      setState(() {
        selectedScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedScreen = 'landing-screen';
      userAnswers = [];
    });
  }

  Widget _getSelectedScreen() {
    if (selectedScreen == 'landing-screen') {
      return LandingScreen(startQuiz: questionsScreenRedirection);
    } else if (selectedScreen == 'questions-screen') {
      return QuestionsScreen(onQuestionAnswered: answerQuestion);
    } else {
      return ResultsScreen(
        chosenAnswers: userAnswers,
        onRestartQuiz: restartQuiz,
      );
    }
  }
}
