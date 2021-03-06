import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizzler/quiz_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String name1;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getName() async {
    final response = await _firestore
        .collection('User')
        .where('Uid', isEqualTo: loggedInUser.uid)
        .get();

    final responseData = response.docs;
    for (var data in responseData) {
      final name = data.data()['Name'];
      setState(() {
        name1 = name;
      });
      print(name1);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    getName();
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
                  'Welcome, $name1',
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
