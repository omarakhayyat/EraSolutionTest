
import 'package:shared_preferences/shared_preferences.dart';
String token;
getToken() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();

   token =  preferences.getString("LastToken");
  return token;
}