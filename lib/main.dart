import 'package:flutter/material.dart';
import 'package:my_app/quiz.dart';
import 'package:my_app/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var totalScore = 0;
  void resetQuiz() {
    setState(() {
      totalScore = 0;
      questionIndex = 0;
    });
  }

  final question = [
    {
      'questionText': 'What is sun called ?',
      'answer': [
        {'text': 'Star', 'score': 5},
        {'text': 'Planet', 'score': 0},
        {'text': 'Asteroid', 'score': 0}
      ],
    },
    {
      'questionText': 'What 2+2 is?',
      'answer': [
        {'text': '1', 'score': 0},
        {'text': '5', 'score': 0},
        {'text': '4', 'score': 5}
      ]
    },
  ];
  var questionIndex = 0;

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App'),
        ),
        body: questionIndex < question.length
            ? Quiz(
                question: question,
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
              )
            : Result(totalScore, resetQuiz),
      ),
    );
  }
}
