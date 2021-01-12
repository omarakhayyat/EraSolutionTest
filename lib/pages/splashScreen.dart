import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_case/functions/saveLogout.dart';
import 'package:test_case/pages/main_page.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 2;

  startTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var formatter = DateFormat('E, d MMM yyyy HH:mm:ss GMT');

    return Timer(Duration(seconds: splashDuration), () async {
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      String tokenExp = preferences.getString("LocalTokenIssued");
      DateTime expiry =
          tokenExp == null ? DateTime.now() : DateTime.parse(tokenExp);
      DateTime now = DateTime.now();

      print(expiry.toString());
      print(now.toString());
      print(now.isAfter(expiry));
      print(now.difference(expiry).inHours);

      if (preferences.getString('LastToken') == null ||
          now.difference(expiry).inHours >= 24 ||
          preferences.getString("LocalTokenIssued") == null) {
        saveLogout();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
      // else if (now.difference(expiry).inHours >= 24) {
      //   saveLogout();
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => MyHomePage()));
      // }
      else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer();

    return Scaffold(
        drawer: drawer,
        body: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black),
                    alignment: FractionalOffset(0.5, 0.3),
                    child: Text(
                      "Era Solution Test",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: Text(
                    "© Era Solution",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )));
  }
}
