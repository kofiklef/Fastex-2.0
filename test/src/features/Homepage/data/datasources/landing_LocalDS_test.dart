import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fastex/core/errors/exceptions.dart';
import 'package:fastex/src/features/Homepage/data/Data_Sources/localDS.dart';
import 'package:fastex/src/features/Homepage/data/models/LandingModels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  LandingLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = LandingLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group("getLastFood:", () {
    final testLandingModel =
        LandingModel.fromJson(json.decode(fixture('data_cached.json')));
    test(
      'should return FoodData from SharedPreferences when there is one in the cache',
      () async {
        // arange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('data_cached.json'));
        // act
        final result = await dataSource.getLastFoodData();

        // assert
        verify(mockSharedPreferences.getString('CACHED_FOOD_DATA'));
        expect(result, equals(testLandingModel));
      },
    );

    test(
      'should should throw [CacheException] when there is not a cached value',
      () async {
        // arange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        final call = dataSource.getLastFoodData();
        // assert
        expect(() => call, throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group("cacheFoodData:", () {
    final testLandingModel = LandingModel(
        name: "Test Name", price: 5, image: "", extraData: "metaData");

    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arange

        // act
        dataSource.cacheFoodData(testLandingModel);
        // assert
        final expectedJsonString = jsonEncode(testLandingModel.toJson());
        verify(
          mockSharedPreferences.setString(
            CACHED_DATA,
            expectedJsonString,
          ),
        );
      },
    );
  });
}
