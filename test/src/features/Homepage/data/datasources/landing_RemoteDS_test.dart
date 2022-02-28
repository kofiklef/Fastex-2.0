import 'package:fastex/core/errors/exceptions.dart';
import 'package:fastex/src/features/Homepage/data/Data_Sources/remoteDS.dart';
import 'package:fastex/src/features/Homepage/data/models/LandingModels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../../../Fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  LandingRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = LandingRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('data.json'), 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  group("getSpecificFoodData:", () {
    const testNumber = 25;
    const testName = "testName";
    final testLandingModel = LandingModel(
        name: testName,
        extraData: 'extraData',
        price: testNumber,
        image: "tui");
    // final Landing testLanding = testLandingModel;

    test(
      'should preform a GET request on a URL with number being the endpoint and with application/json header',
      () async {
        // arange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getSpecificFoodData(testName);
        // assert

        var authority = "https://fastexapi.azurewebsites.net";
        var path = "api/Products/GetProducts/$testName";
        verify(mockHttpClient.get(
          Uri.parse('$authority/$path'),
          headers: {'Content-Type': 'application/json'},
        ));
        verifyNoMoreInteractions(mockHttpClient);
      },
    );

    test(
      'should return FoodData when the response code is 200 (success)',
      () async {
        // arange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getSpecificFoodData(testName);
        // assert
        expect(result, equals(testLandingModel));
      },
    );

    test(
      'should throw a [ServerException] when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        /*final call = */ dataSource.getSpecificFoodData(testName);
        // assert
        expect(() => call(testName),
            throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}

call(String testName) {}
