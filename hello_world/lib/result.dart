import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = "Your are awesome";
    } else if (resultScore <= 18) {
      resultText = 'U r strange ?';
    } else {
      resultText = "R u normal?";
    }
    return resultText;
  }



  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text("Restart Quiz ?"),
          textColor: Colors.blue,
          onPressed: resetHandler,
        )
      ],
    ));
  }
}