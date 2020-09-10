import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/screens/QuizPage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Center(child: Text('WELCOME')),
      ),
      body: Container(
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
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: Container(
                    child: ColorizeAnimatedTextKit(text:['Test Your Knowledge in Football'],
                      colors: [
                        Colors.white,
                        Color(0xFF010080),
                        Colors.green,
                        Colors.orange
                      ],
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),),
            ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.0),
                child: Container(
                    child: GestureDetector(
                        child: Icon(Icons.play_arrow,size: 120.0,color: Colors.green,),
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return QuizPage();
                      }));
                    }
                ),
              ),
            )
            )
          ]
        ),
      ),
    );
  }
}
