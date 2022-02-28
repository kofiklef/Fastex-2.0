// ignore_for_file: file_names

import 'dart:convert';

import 'package:fastex/core/errors/exceptions.dart';
import 'package:fastex/src/features/Homepage/data/models/LandingModels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class LandingRemoteDataSource {
  /// Calls the http://fastexapi.azurewebsites.net/api/Products/GetProduct/{id} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LandingModel> getSpecificFoodData(String name);

  /// Calls the http://fastexapi.azurewebsites.net/api/Products/GetAllProducts endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LandingModel> getAllFoodData();
}

class LandingRemoteDataSourceImpl implements LandingRemoteDataSource {
  final http.Client client;
  LandingRemoteDataSourceImpl({@required this.client});
  @override
  Future<LandingModel> getSpecificFoodData(String name) async {
    // TODO: implement getSpecificFoodData
    final response = await client.get(
      Uri.parse('https://fastexapi.azurewebsites.net/api/Products/GetProducts/$name'),

      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return LandingModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<LandingModel> getAllFoodData() {
    // TODO: implement getAllFoodData

    return null;
  }
}
