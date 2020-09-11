import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase{
    var resultText = 'You have completed the quiz';
    if(resultScore <= -15)
      {
        resultText += 'Your dont know me';
      }
    else if(resultScore == -10)
      {
        resultText += 'You barely know me';
      }
    else if(resultScore == -5)
      {
        resultText += 'You know me so little';
      }
    else{
      resultText += 'You know me well';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context)
  {
    return Center
      (child: Column(
      children: <Widget>[
          Text
            (resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        FlatButton(
          child: Text('Restart Quiz!'),
          textColor: Colors.blue,
          onPressed: resetHandler,)
    ]
    ),
    );
  }
}