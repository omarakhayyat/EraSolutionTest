import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:test_case/functions/showDialogButton.dart';
import 'package:test_case/model/loginModel.dart';
import 'package:test_case/pages/main_page.dart';

Future<LoginModel> requestLoginAPI(
    BuildContext context, String username, String password) async {
  final url = "https://disinfection.azurewebsites.net/users/authenticate";

  Map<String, String> body = {
    'username': username,
    'password': password,
  };
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  final response = await http.post(
    url,
    body: utf8.encode(json.encode(body)),
    headers: headers,
  );
  final responseJson = json.decode(response.body);
  var user = LoginModel.fromJson(responseJson);
  if (response.statusCode == 200 && user.sucess == true) {
    print(responseJson);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));

    return LoginModel.fromJson(responseJson);
  } else {
    showDialogSingleButton(
        context,
        "Unable to Login",
        "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.",
        "OK");
    return null;
  }
}
