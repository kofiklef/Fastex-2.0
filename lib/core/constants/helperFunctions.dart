import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static String hashedPassword = "hashedPassword";
  static String password = "password";
  static String userEmailKey = "UserEmailKey";
  static String username = "";

  static Future<bool> saveUserLoggedInState(bool isLoggedin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(password, isLoggedin);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(username, userName);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmailKey, userEmail);
  }

   static Future<bool> saveHashPassword(String paasswordHash) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmailKey, paasswordHash);
  }

  //! get data from sharedPreferences
  static Future<String> getUserLoggedInState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(hashedPassword);
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(username);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  static Future<String> getPasswordHash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(hashedPassword);
  }
}
