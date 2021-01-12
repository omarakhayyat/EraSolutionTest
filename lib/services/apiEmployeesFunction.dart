import 'dart:convert';

import 'package:test_case/model/employeesModel.dart';
import 'package:test_case/model/rolesModel.dart';
import 'package:http/http.dart' as http;

Future<EmployeesModel> employeesGet() async {
  final url = "https://disinfection.azurewebsites.net/employees/getAll";

  var response;

  try {
    response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      var user = EmployeesModel.fromJson(responseJson);
      print(responseJson);

      return EmployeesModel.fromJson(responseJson);
    } else {
      return null;
    }
  } catch (e) {
    print(e.toString());
  }
}
