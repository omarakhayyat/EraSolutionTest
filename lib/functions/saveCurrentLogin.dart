import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_case/model/loginModel.dart';

saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  var user;
  if ((responseJson != null && responseJson.isNotEmpty)) {
    user = LoginModel.fromJson(responseJson).user.username;
  } else {
    user = "";
  }
  var token = (responseJson != null && responseJson.isNotEmpty)
      ? LoginModel.fromJson(responseJson).token
      : "";

  await preferences.setString(
      'LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString(
      'LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setString('LocalTokenIssued', DateTime.now().toString());
}
