// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:fastex/src/features/Authentication/data/models/authModels.dart';
import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FastexAPI {
  var authority = "fastexapi.azurewebsites.net";

  Future<List<Product>> fetchFoods() async {
    final url = Uri.https(authority, "/api/Products/GetAllProducts");
    final response = await http.get(url);
    return productFromJson(response.body);
  }

  Future registerUser(int id, String userName, email, password, phone) async {
    Map<String, dynamic> mappedData = {
      "id": id,
      "email": email,
      "userName": userName,
      "password": password,
      "phoneNumber": phone,
    };

    final url = Uri.https(authority, "/api/Users/AddUser/");
    final response = await http.post(
      url,
      body: json.encode(mappedData),
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200) {
      var responses = jsonDecode(response.body);
      print("RESPONSE: $response");
      print("DATA: $responses");
    } else if (response.statusCode == 400) {
      throw Exception(" 400: BAD REQUEST");
    } else {
      throw Exception(" 404: PAGE NOT FOUND!");
    }

    //getting response from php code, here
    // var data = jsonDecode(reponses.body);
  }

  login(String email, String password) async {
    try {
      final url = Uri.http(authority, "/api/Users/AddUser");
      final response = await http.post(url);
      return authServiceFromJson(response.body);
    } catch (err) {
      Get.snackbar("", err.toString());
    }
  }
}
