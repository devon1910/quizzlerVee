import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/options.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Options> _quizOpt = [Options(a: 'E.Emenike', b: 'Sunday Mbah', c: 'John Obi Mikel', d: 'Brown Ideye'),
    Options(a: '2001/2002', b: '2002/2003', c: '2003/2004', d: '2004/2005'),
    Options(a: 'Diego Costa', b: 'Pedro', c: 'Willian', d: 'Eden Hazard'),
    Options(a: 'David Trezeguet', b: 'Thierry Henry', c: 'Davidson Ekpokpobe', d: 'Frank Ribery'),
    Options(a: 'Radipho Mphela', b: 'Steven Pienaar', c: 'Siphiwe Tshabalala', d: 'Bernard Parker'),
    Options(a: '1998', b: '1990', c: '1994', d: '1996'),
    Options(a: 'Was saved', b: 'Hit the Bar', c: 'Missed the target', d: 'Hit the back of the Net'),
    Options(a: 'Edin Dzeko', b: 'Pablo Zabeleta', c: 'Sergio Aguero', d: 'Mario Balotelli'),
    Options(a: 'Panathinaikos', b: 'AS ROMA', c: 'Real Madrid', d: 'AC Milan'),
    Options(a: 'Brazil', b: 'West Germany', c: 'Argentina', d: 'Uruguay')];

  List<Questions> _quizQues = [Questions(question:'Nigeria beat burkina Faso 1-0 in the 2013 AFCON finals, who scored the winner?',answer: 'Sunday Mbah'),
    Questions(question: 'What season did Arsenal complete the entire EPL campaign unbeaten?',answer: '2003/2004'),
    Questions(question: 'In 2016, Chelsea Beat Tottenham 2-1 which secured  the EPL title for the Foxes,The deciding goal was scored by...',answer: 'Eden Hazard'),
    Questions(question: 'Who missed the deciding penalty in the 2006 World cup hosted in Germany?',answer: 'David Trezeguet'),
    Questions(question: 'Who scored the opening goal in the 2010 World cup?',answer: 'Siphiwe Tshabalala'),
    Questions(question: 'The Nigerian National Football Team won the Olympic Games in...',answer: '1996'),
    Questions(question: 'Lionel Messi\'s Penalty against Chelsea in the 2012 UCL Semi-final 1st Leg...',answer: 'Hit the Bar'),
    Questions(question: 'in 2012, Mancity cameback against QPR to clinch the EPL title, The 1st goal of the match was scored by...',answer: 'Pablo Zabeleta'),
    Questions(question: 'Michael Essien Played for all but one of these clubs',answer: 'AS ROMA'),
    Questions(question: 'Which country won the first ever World cup?',answer: 'Uruguay'),
  ];

  String getQuestion() {
    return _quizQues[_questionNumber].question;
  }
  void nextQuestion() {
    if (_questionNumber < _quizQues.length - 1) {
      _questionNumber++;
    }
  }

  String getAnswer() {
    return _quizQues[_questionNumber].answer;
  }

  bool isFinished() {
    if (_questionNumber >= _quizQues.length - 1) {
      return true;
    }
    return false;
  }
  String getOptA(){
    return _quizOpt[_questionNumber].a;
  }
  String getOptB(){
    return _quizOpt[_questionNumber].b;
  }
  String getOptC(){
    return _quizOpt[_questionNumber].c;
  }
  String getOptD(){
    return _quizOpt[_questionNumber].d;
  }
  void reset() {
    _questionNumber = 0;
  }
}