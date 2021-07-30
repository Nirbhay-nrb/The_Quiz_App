import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'quiz_page.dart';
import 'startpage.dart';
import 'view_score.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'home_screen.dart';
import 'login.dart';
import 'register.dart';

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
