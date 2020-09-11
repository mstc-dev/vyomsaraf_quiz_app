import 'package:flutter/material.dart';
import 'package:flutter_app_1/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>
{
  final _questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answers' : [
                    {'text':'Blue', 'score': -5 },
                    {'text':'Red', 'score': 0 },
                    {'text':'Pink', 'score': 10 },
                    {'text':'Black', 'score': 5 },],
    },
    {
      'questionText':'What is your favourite animal?',
      'answers' : [
                    {'text':'Tiger', 'score': 5},
                    {'text':'Lion', 'score': 0},
                    {'text':'Cat', 'score': 10},
                    {'text':'Rabbit', 'score': -5},],
    },
    {
      'questionText':'What is your favourite food item',
      'answers':[
                  {'text':'Plain dosa', 'score': 5},
                  {'text':'dal bati', 'score': -5},
                  {'text':'white sauce pasta', 'score': 0},
                  {'text':'panipuri', 'score': 10}],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz()
  {
    setState((){
      _questionIndex = 0;
      _totalScore = 0;
    });

  }

  void _answerQuestion(int score)
  {
    _totalScore +=  score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length)
    {
      print('We have more questions!!');
    }
    else{
      print('No more questions left!!!');
    }
  }
  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
    ),
      body: _questionIndex < _questions.length
          ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
               )
          : Result(_totalScore, _resetQuiz)
    ,),
      );
  }

}