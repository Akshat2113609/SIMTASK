import 'package:flutter/material.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;

  List<Question> _questions = [
    Question('Flutter is developed by Google.', true),
    Question('Dart is a statically typed language.', false),
    Question('Widgets in Flutter are immutable.', true),
    Question('Flutter is based on Java programming language.', false),
  ];

  void _checkAnswer(bool userAnswer) {
    if (_quizCompleted) {
      return;
    }

    bool correctAnswer = _questions[_currentIndex].answer;
    if (userAnswer == correctAnswer) {
      setState(() {
        _score++;
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      setState(() {
        _quizCompleted = true;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.quiz),
            SizedBox(width: 8.0),
            Text('Quiz App'),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _quizCompleted ? ResultScreen(_score, _questions.length, _resetQuiz) : _buildQuizScreen(),
      ),
    );
  }

  Widget _buildQuizScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Question ${_currentIndex + 1}/${_questions.length}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          _questions[_currentIndex].question,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () => _checkAnswer(true),
          child: Text('True'),
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () => _checkAnswer(false),
          child: Text('False'),
        ),
        SizedBox(height: 16.0),
        Text(
          'Score: $_score',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
