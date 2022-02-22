import 'dart:convert';

import 'package:fastex/src/features/Homepage/data/models/LandingModels.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../Fixtures/fixture_reader.dart';

void main() {
  final testLandingModel = LandingModel(
    name: "testName",
    price: 25,
    image: "tui",
    extraData: "extraData",
  );

  test(
    'should be a sub-class of LandingPage Entity',
    () async {
      // arange

      // act

      // assert
      expect(testLandingModel, isA<Landing>());
    },
  );
  group("fromJson", () {
    test(
      'should return a valid model when the price is an integer',
      () async {
        // arange
        final Map<String, dynamic> jsonMap = jsonDecode(fixture("data.json"));
        // act
        final result = LandingModel.fromJson(jsonMap);
        // assert
        expect(result, testLandingModel);
      },
    );
    test(
      'should return a valid model when the [JSON price] is regarded as a double',
      () async {
        // arange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('data_double.json'));
        // act
        final result = LandingModel.fromJson(jsonMap);
        // assert
        expect(result, testLandingModel);
      },
    );
  });

  group("toJson", () {
    test(
      'should return a JSON map containing PROPER DATA',
      () async {
        // arange

        // act
        final result = testLandingModel.toJson();
        // assert
        final expectedJsonMap = {
          "name": "testName",
          "price": 25,
          "image": "tui",
          "extraData": "extraData",
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
