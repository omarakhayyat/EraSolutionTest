import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testCase/pages/main_page.dart';
import 'package:testCase/pages/splashScreen.dart';
import 'package:testCase/services/apiLoginFunction.dart';

import 'functions/getToken.dart';

String _resCode, _resToken, _prefsToken;

Map<String, dynamic> resBody;
int bodyLength = resBody.length;

void main() => runApp(MyApp());
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final passControl = TextEditingController();
  final userControl = TextEditingController();
  final _userNameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _userNameKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) return 'Please enter username';
                      },
                      controller: userControl,
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) return 'Please enter password';
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      controller: passControl,
                    ),
                    RaisedButton(
                      child: Text("Logon"),
                      onPressed: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();

                        if (_userNameKey.currentState.validate()) {
                          requestLoginAPI(
                              context, userControl.text, passControl.text);
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CircularProgressIndicator(),
                                  Text("    Loading"),
                                ],
                              ),
                            ),
                          );
                        }
                        print(getToken());
                        print(userControl.text);
                        print(passControl.text);
                      },
                    ),
                    RaisedButton(
                        child: Text("NextPage"),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
