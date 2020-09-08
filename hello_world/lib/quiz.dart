import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  Quiz({this.questions, this.questionIndex, this.answerQuestion});
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Question(questions[this.questionIndex]['questionText']),
            ...(questions[this.questionIndex]['answers'] as List<Map<String,Object>>).map((a) {
              return Answer(() => answerQuestion(a['score']),a['text']);
            }).toList(),
          ],
        );
  }
}