// ignore_for_file: constant_identifier_names, file_names

import 'dart:convert';

import 'package:fastex/core/errors/exceptions.dart';
import 'package:fastex/src/features/Homepage/data/models/LandingModels.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_DATA = "CACHED_FOOD_DATA";

abstract class LandingLocalDataSource {
  // Gets the cached [LandingModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.

  Future<LandingModel> getLastFoodData();
  Future<void> cacheFoodData(LandingModel foodToCache);
}

class LandingLocalDataSourceImpl implements LandingLocalDataSource {
  final SharedPreferences sharedPreferences;

  LandingLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<LandingModel> getLastFoodData() {
    final jsonString = sharedPreferences.getString(CACHED_DATA);
    if (jsonString != null) {
      return Future.value(LandingModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheFoodData(LandingModel foodToCache) {
    return sharedPreferences.setString(
        CACHED_DATA, jsonEncode(foodToCache.toJson()));
  }
}
