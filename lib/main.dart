import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import 'quiz.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
          {'text' : 'Black', 'score': 10},
          {'text' : 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text' : 'White' , 'score' : 1}],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text' : 'Rabbit', 'score': 3},
        {'text' : 'Snake', 'score': 11},
        {'text' : 'Elephant', 'score': 5},
        {'text' : 'Lion', 'score': 9}
        ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text' : 'Max', 'score': 1},
        {'text' : 'Ranga', 'score': 1},
        {'text' : 'Andrei', 'score': 1},
        {'text' : 'Surendra', 'score': 1}
        ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

   void _answerQuestion(int score) {

     _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
      print('We have more questions');
    } else{
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {


    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    //questions = []; does not work if questions is a const

    return  Scaffold(
        appBar: AppBar(title: Text("My First App")),
        body: _questionIndex < _questions.length ?
        Quiz(
            questions: _questions,
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex) :
        Result(_totalScore, _resetQuiz),

    );
  }
}
