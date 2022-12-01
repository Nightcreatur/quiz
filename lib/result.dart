import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String get resultPharse {
    var resultText = 'You did it mf';
    if (resultScore <= 5) {
      resultText = 'Noob';
    } else if (resultScore == 0) {
      resultText = 'Noob Pro Max';
    } else {
      resultText = 'Pretty Smart huh !';
    }
    return resultText;
  }

  final VoidCallback resetHandler;
  final int resultScore;
  const Result(this.resultScore, this.resetHandler, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPharse,
          style: const TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(onPressed: resetHandler, child: const Text('Restart'))
      ],
    ));
  }
}
