// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'dart:io';

import 'package:fastex/core/failures/serverFailure.dart';
import 'package:fastex/src/features/Authentication/data/models/authModels.dart';
import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FastexAPI {
  var authority = "fastexapi.azurewebsites.net";
  int index;

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
        // Uri.parse("$authority/api/Users/Adduser"),
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

  login(String email, String password) async {
    try {
      final url = Uri.http(authority, "/api/Users/AddUser");
      final response = await http.post(url);
      return postFromJson(response.body);
    } catch (err) {
      Get.snackbar("", err.toString());
    }
  }
}
