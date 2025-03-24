import 'package:flutter/material.dart';
import 'package:quiz_screen/data/question.dart';
import 'package:quiz_screen/question_screen.dart';
import 'package:quiz_screen/start_screen.dart';
import 'package:quiz_screen/results_screen.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizAppState();
}

class _QuizAppState extends State<Quiz> {
  List<String> _chosenAnswers = [];
  String _activeScreen = 'start-screen';

  void _switchToQuizScreen() {
    setState(() {
      _activeScreen = 'question-screen';
    });
  }

  void _chooseAnswer(String answer) {
    setState(() {
      _chosenAnswers.add(answer);
      if (_chosenAnswers.length == question.length) {
        _activeScreen = 'results-screen';
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _chosenAnswers = [];
      _activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    if (_activeScreen == 'start-screen') {
      screenWidget = StartScreen(_switchToQuizScreen);
    } else if (_activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: _chooseAnswer);
    } else {
      screenWidget = ResultsScreen(
        chosenAnswer: _chosenAnswers,
        onRestart: _restartQuiz, // Pass the restart function
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
