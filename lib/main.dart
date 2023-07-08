import 'package:flutter/material.dart';
import 'package:quizapp/quiz_screen.dart';
import 'package:quizapp/screens/quiz_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: QuizScreen(),
    );
  }
}


