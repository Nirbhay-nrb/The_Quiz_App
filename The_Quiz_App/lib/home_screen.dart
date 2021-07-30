import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
                    'The Quiz App',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontFamily: 'SacraMento',
                      fontWeight: FontWeight.bold,
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
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'login-route');
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
                      'REGISTER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'register-route');
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
