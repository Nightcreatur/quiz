import 'package:flutter/material.dart';
import 'package:my_app/answer.dart';
import 'package:my_app/question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final int questionIndex;

  final List<Map<String, Object>> question;
  const Quiz(
      {super.key,
      required this.answerQuestion,
      required this.question,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[questionIndex]['questionText'] as String),
        // spreading ansewer as a list of string
        ...(question[questionIndex]['answer'] as List<Map<String, Object>>).map(
          (answer) {
            return Answer(
              () => answerQuestion(answer['score']),
              answer['text'] as String,
            );
          },
        ),
      ],
    );
  }
}
