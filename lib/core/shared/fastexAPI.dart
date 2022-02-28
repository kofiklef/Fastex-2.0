// ignore_for_file: unrelated_type_equality_checks, file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:fastex/core/failures/serverFailure.dart';
import 'package:fastex/src/features/Authentication/data/models/authModels.dart';
import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FastexAPI {
  var authority = "fastexapi.azurewebsites.net";
  // int index;

  var token;

  Future<List<Product>> fetchFoods() async {
    final url = Uri.https(authority, "/api/Products/GetAllProducts");
    final response = await http.get(url);
    return productFromJson(response.body);
  }

  getSpecificFood(int index) async {
    var httpClient = HttpClient();
    await Future.delayed(const Duration(milliseconds: 500));
    final url = Uri.https(authority, "/api/Products/GetProducts/$index");
    var request = await httpClient.getUrl(url);
    final response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    // return productFromJson(response.body);
    return responseBody;
  }

  Future<List<Post>> registerUser(
      int id, String userName, email, password, phone) async {
    Map<String, dynamic> mappedData = {
      "id": id,
      "email": email,
      "userName": userName,
      "passwordHash": password,
      "phoneNumber": phone,
      "isVendor": false,
      "agreedTOC": false,
    };
    final url = Uri.http(authority, "/api/Users/AddUser");
    try {
      final response = await http.post(
        url,
        body: mappedData,
        encoding: Encoding.getByName("utf-8"),
      );
      return postFromJson(response.body);
    } on SocketException {
      throw ServerFailure("No Internet Connection!");
    } on HttpException {
      throw ServerFailure("Couldn't find post!");
    } on FormatException {
      throw ServerFailure("Bad Response Format...");
    }
  }

  login(authRequest) async {
    try {
      final url = Uri.http(authority, "/api/Users/AddUser");
      final response = await http.post(url);
      return postFromJson(response.body);
    } catch (err) {
      // Get.snackbar("", err.toString());
      return null;
    }
  }

  /// New methods
  ///

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  authData(Map<String, dynamic> data, apiUrl) async {
    var unencodedPath = "/api/Users/AddUser";
    Uri fullUrl = Uri.http(authority, unencodedPath);
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  getData(apiUrl) async {
    Uri fullUrl = (authority + apiUrl) as Uri;
    await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
