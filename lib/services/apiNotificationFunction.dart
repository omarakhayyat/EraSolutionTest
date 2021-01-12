import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:testCase/model/loginModel.dart';
import 'package:testCase/model/notificationModel.dart';

Future<NotificationModel> notificationGet() async {
  final url = "https://disinfection.azurewebsites.net/notification/getAll";

  var response;

  try {
    response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      var user = NotificationModel.fromJson(responseJson);
      print(responseJson);

      return NotificationModel.fromJson(responseJson);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<NotificationModel> notificationHighTempGet() async {
  final url =
      "https://disinfection.azurewebsites.net/notification/getHighTempreture";

  var response;

  try {
    response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      var user = NotificationModel.fromJson(responseJson);
      print(responseJson);

      return NotificationModel.fromJson(responseJson);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<NotificationModel> notificationUpdate() async {
  final url = "https://disinfection.azurewebsites.net/notification/update";

  var response;

  try {
    response = await http.post(
      url,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      var user = NotificationModel.fromJson(responseJson);
      print(responseJson);

      return NotificationModel.fromJson(responseJson);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}
