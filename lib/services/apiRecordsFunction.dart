import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testCase/model/employeesModel.dart';
import 'package:testCase/model/recordsModel.dart';
import 'package:testCase/model/rolesModel.dart';
import 'package:http/http.dart' as http;

Future<RecordsModel> recordsGet() async {
  final url = "https://disinfection.azurewebsites.net/records/getAll";

  var response;

  try {
    response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      var user = RecordsModel.fromJson(responseJson);
      print(responseJson);

      return RecordsModel.fromJson(responseJson);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<RecordsModel> recordsGetWithFilter(
    {@required int from, @required int to}) async {
  final url = "https://disinfection.azurewebsites.net/records/getAll";

  Map<String, dynamic> body = {
    "from": from,
    "to": to,
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
      var user = RecordsModel.fromJson(responseJson);
      print(responseJson);

      return RecordsModel.fromJson(responseJson);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}
