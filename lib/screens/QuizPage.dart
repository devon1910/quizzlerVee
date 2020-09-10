import 'dart:async';
import 'package:flutter/material.dart';
import '../quizBrain.dart';
import 'ResultPage.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

enum Ans{a,b,c,d}
class _QuizPageState extends State<QuizPage> {
  int _counter=10;
  Ans pickedAns;
  Timer _timer;
  QuizBrain qb=QuizBrain();
  List<Icon> scoreKeeper=[];

  String correctAnswer;
  int count=0;

  void checkAnswer(String userAnswer){
    correctAnswer=qb.getAnswer();
    setState(() {
      if(qb.isFinished()==true) {
        _timer.cancel();
        qb.reset();
        scoreKeeper.clear();
        _timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ResultPage(result: count);
        }));
      }
      else{
        _startTimer();
        if(correctAnswer==userAnswer){
          scoreKeeper.add(Icon(Icons.brightness_1,color: Colors.green));
          count++;
        }
        else{
          scoreKeeper.add(Icon(Icons.brightness_1,color: Colors.red));
        }
        qb.nextQuestion();
        pickedAns=null;
      }
    }
    );
  }

  void _startTimer(){
    _counter=10;

    if(_timer!=null){
      _timer.cancel();//Useful to avoid the race and unnecessary Running of clock
    }
    _timer=Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        if(_counter>0){
          _counter--;
        }else{
          //_timer.cancel();
          resetCounter();
          scoreKeeper.add(Icon(Icons.brightness_1,color: Colors.red));
          qb.nextQuestion();
          pickedAns=null;
        }
      });
    });
  }
  void resetCounter(){
    _counter=10;
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/home3.jpg'),
          fit: BoxFit.cover,

          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop),

        ),

      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '$_counter',
            style: TextStyle(color: Colors.white,fontSize: 60.0) ,),

          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(qb.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          OptionPane(text: 'a.  '+qb.getOptA(),
              checkOpt: () {
              pickedAns=Ans.a;
              checkAnswer(qb.getOptA());
              resetCounter();
              },
            // color: pickedAns==Ans.a ? Color(0xFF010080):Colors.black  ,
          ),
          OptionPane(text: 'b.  '+qb.getOptB(),
            checkOpt: () {
              checkAnswer(qb.getOptB());
              pickedAns=Ans.b;
              resetCounter();
              //The user picked false.
            },
            //color: pickedAns==Ans.b ? Color(0xFF010080):Colors.black  ,
          ),
          OptionPane(text: 'c.  '+qb.getOptC(),
            checkOpt: () {
              pickedAns=Ans.c;
              checkAnswer(qb.getOptC());
              resetCounter();
              //The user picked false.
            },
           // color: pickedAns==Ans.c ? Color(0xFF010080):Colors.black  ,
            ),
          OptionPane(text: 'd.  '+qb.getOptD(),
              checkOpt: () {
                pickedAns=Ans.d;
                checkAnswer(qb.getOptD());
                resetCounter();
              },
           // color: pickedAns==Ans.d ? Color(0xFF010080):Colors.black  ,
          ),
          Row(
              children: scoreKeeper

          )
        ],
      ),
    )
    )
      )
    );
  }
}


class  OptionPane extends StatelessWidget {
  final Function checkOpt;
  final String text;
 // final Color color;


  OptionPane({this.checkOpt, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          // textColor: Colors.white,
          //color: Colors.black,

            child: Material(
              borderRadius:BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),topRight: Radius.circular(30.0)),
              elevation: 5.0,
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                child: (
                    Text(
                        text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0)
                    )
                ),
              ),
            ),
            onTap: checkOpt
        ),
      ),
    );
  }
}