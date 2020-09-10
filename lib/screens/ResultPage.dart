import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ResultPage extends StatelessWidget {
  final result;

  ResultPage({this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Center(child: Text('SCORE')),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/home6.jpg'),
            fit: BoxFit.cover,

            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.dstATop),
          ),

        ),
        constraints: BoxConstraints.expand(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: <Widget>[
                      ColorizeAnimatedTextKit(text:['Your Score:$result/10'],
                        colors: [
                          Colors.white,
                          Color(0xFF010080),
                          Colors.green,
                          Colors.orange
                        ],
                        textStyle: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                        ),),

                    ],
                  ),
                )
              ),
              Expanded(
                flex: 6,//take as 5 as much space as the above
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                  child: Column(
                    children: [
                      Answers(text:'Sunday Mbah'),
                      Answers(text:'2003/2004',),
                      Answers(text:'Eden Hazard',),
                      Answers(text:'David Trezeguet',),
                      Answers(text:'Siphiwe Tshabalala',),
                      Answers(text:'1996',),
                      Answers(text:'Hit the Bar',),
                      Answers(text:'Pablo Zabeleta',),
                      Answers(text:'AS ROMA',),
                      Answers(text:'Uruguay',)
                    ]
                  ),
                )
              ),
             Expanded(
               child: Container(
                 child: FlatButton(
                     child: Padding(
                       padding: EdgeInsets.symmetric(vertical: 5.0),
                       child: ColorizeAnimatedTextKit(text:['Play Again?!'],
                         colors: [
                           Colors.white,
                           //Color(0xFF010080),
                           Colors.green,
                           Colors.orange
                         ],
                         textStyle: TextStyle(
                           fontSize: 30.0,
                           fontWeight: FontWeight.w900,
                         ),),
                     ),
                 onPressed: (){
                       Navigator.pop(context);
                 },),
               ),
             )
            ]
        ),
      ),
    );
  }
}

class Answers extends StatelessWidget {
  final text;
  Answers({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        child: Text(text)
    );
  }
}

