import 'package:flutter/material.dart';
import 'package:quizzler/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _auth = FirebaseAuth.instance;
  // FirebaseUser loggedInUser;

  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser();
  //     if (user != null) {
  //       loggedInUser = user;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Welcome, name',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 10.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FlatButton(
                minWidth: 200,
                textColor: Colors.white,
                color: Color(0xFF01937C),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'START',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'quiz-route');
                  quizBrain.reset();
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              FlatButton(
                minWidth: 200,
                textColor: Colors.white,
                color: Color(0xFF01937C),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'VIEW SCORES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'viewscore-route');
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              FlatButton(
                minWidth: 200,
                textColor: Colors.white,
                color: Color(0xFF01937C),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'LOGOUT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pushNamed(context, 'home-route');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
