import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
      if (_questionIndex >= 3) {
        _questionIndex = 0;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s is your favorite color ?',
        'answers': ['red', 'green', 'blue', 'black']
      },
      {
        'questionText': 'What\'s is your favorite animal ?',
        'answers': ['rabbit', 'snake', 'lion', 'snail']
      },
      {
        'questionText': 'What\'s is your favorite instructor?',
        'answers': ['max', 'max', 'max', 'max']
      },
    ];

    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Miro app'),
        ),
        body: Column(
          children: [
            Question(questions[this._questionIndex]['questionText']),
            ...(questions[this._questionIndex]['answers'] as List<String>).map((a) {
              return Answer(_answerQuestion,a);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
