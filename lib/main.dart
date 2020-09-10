import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/screens/QuizPage.dart';
import 'package:quizzler/screens/ResultPage.dart';
import 'package:quizzler/screens/Welcome.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
