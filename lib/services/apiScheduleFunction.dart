import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_case/model/rolesModel.dart';
import 'package:http/http.dart' as http;
import 'package:test_case/model/scheduleModel.dart';

Future<ScheduleModel> scheduleGet() async {
  final url = "https://disinfection.azurewebsites.net/schedule/getAll";

  var response;

  try {
    response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      var user = ScheduleModel.fromJson(responseJson);
      print(responseJson);

      return ScheduleModel.fromJson(responseJson);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<ScheduleModel> scheduleAdd(
    {@required String name,
    @required int startTime,
    @required int startMinutes,
    @required int endTime,
    @required int endMinutes}) async {
  final url = "https://disinfection.azurewebsites.net/schedule/add";

  Map<String, dynamic> body = {
    "name": name,
    "startTime": startTime,
    "startMinutes": startMinutes,
    "endTime": endTime,
    "endMinutes": endMinutes
  };

  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  var response;

  try {
    response = await http.post(
      url,
      body: utf8.encode(json.encode(body)),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      var user = ScheduleModel.fromJson(responseJson);
      print(responseJson);

      return ScheduleModel.fromJson(responseJson);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}
