import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/startpage.dart';
import 'package:quizzler/view_score.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
import 'home_screen.dart';
import 'login.dart';
import 'register.dart';

QuizBrain quizBrain = QuizBrain();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'start-route': (ctx) => StartPage(),
        'quiz-route': (ctx) => QuizPage(),
        'home-route': (ctx) => HomeScreen(),
        'login-route': (ctx) => Login(),
        'register-route': (ctx) => Register(),
        'viewscore-route': (ctx) => ViewScore(),
      },
      initialRoute: 'home-route',
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int marksScored = 0;
  void checkAnswer(String userPickedAnswer) {
    // to be changed
    String correctAnswer1 = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished()) {
        if (userPickedAnswer == correctAnswer1) {
          marksScored++;
        }
        Alert(
            context: context,
            title: "End of Quiz",
            desc: "Your Score = $marksScored/5",
            buttons: [
              DialogButton(
                  child: Text('Back to Home'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'start-route');
                  })
            ]).show();
        quizBrain.reset();
        scoreKeeper.clear();
        marksScored = 0;
      } else {
        if (userPickedAnswer == correctAnswer1) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          marksScored++;
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  void initState() {
    super.initState();
    quizBrain.getRandomNumbers();
    quizBrain.setQuestionNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Color(0xFF01937C),
                    child: Text(
                      quizBrain.getOptA(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(quizBrain.getOptA());
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Color(0xFF01937C),
                    child: Text(
                      quizBrain.getOptB(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(quizBrain.getOptB());
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Color(0xFF01937C),
                    child: Text(
                      quizBrain.getOptC(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(quizBrain.getOptC());
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Color(0xFF01937C),
                    child: Text(
                      quizBrain.getOptD(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(quizBrain.getOptD());
                    },
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
