import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_case/model/rolesModel.dart';
import 'package:http/http.dart' as http;

Future<RolesModel> rolesGet() async {
  final url = "https://disinfection.azurewebsites.net/roles/getAll";

  var response;

  try {
    response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      var user = RolesModel.fromJson(responseJson);
      print(responseJson);

      return RolesModel.fromJson(responseJson);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<dynamic> rolesAdd(
    {@required int groupId,
    @required String groupName,
    @required String department}) async {
  final url = "https://disinfection.azurewebsites.net/roles/add";

  Map<String, dynamic> body = {
    "groupId": groupId,
    "groupName": groupName,
    "department": department,
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
      var user = RolesModel.fromJson(responseJson);
      print(responseJson);

      return responseJson;
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}
