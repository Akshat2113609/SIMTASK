import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRestartQuiz;

  ResultScreen(this.score, this.totalQuestions, this.onRestartQuiz);

  @override
  Widget build(BuildContext context) {
    String resultText = score > 2 ? 'Passed' : 'Failed';
    Color resultColor = score > 2 ? Colors.green : Colors.red;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Quiz Completed!',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'Your Score: $score/$totalQuestions',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          resultText,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: resultColor,
          ),
        ),
        Center(child: SizedBox(height: 24.0)),
        ElevatedButton(
          onPressed: onRestartQuiz,
          child: Text('Restart Quiz'),
        ),
      ],
    );
  }
}
