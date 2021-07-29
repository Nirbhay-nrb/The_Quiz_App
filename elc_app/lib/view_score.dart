import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewScore extends StatefulWidget {
  @override
  _ViewScoreState createState() => _ViewScoreState();
}

class _ViewScoreState extends State<ViewScore> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  List score = [];

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
        .collection('Marks')
        .where('Uid', isEqualTo: loggedInUser.uid)
        .orderBy('Time', descending: true)
        .get();

    final responseData = response.docs;
    for (var data in responseData) {
      final name = data.data()['Marks'];
      score.add(name);
      print(name);
      print(score.length);
    }
    setState(() {});
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
      appBar: AppBar(
        title: Text(
          'Your Score',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade500,
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: score.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        '${score[index]}/5',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
