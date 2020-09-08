import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s is your favorite color ?',
      'answers': [
        {'text': 'red', 'score': 10},
        {'text': 'green', 'score': 5},
        {'text': 'blue', 'score': 3},
        {'text': 'black', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s is your favorite animal ?',
      'answers': [
        {'text': 'rabbit', 'score': 10},
        {'text': 'wolf', 'score': 5},
        {'text': 'elephant', 'score': 3},
        {'text': 'turtle', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s is your favorite instructor?',
      'answers': [
        {'text': 'Mad', 'score': 10},
        {'text': 'Max', 'score': 5},
        {'text': 'Joe', 'score': 3},
        {'text': 'Charlie', 'score': 1}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
    });
    _totalscore = 0;
  }

  void _answerQuestion(int score) {
    _totalscore += score;
    print(_totalscore);
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Miro app'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: this._answerQuestion,
              )
            : Result(_totalscore,_resetQuiz),
      ),
    );
  }
}
