import 'package:dartz/dartz.dart';
import 'package:fastex/core/errors/exceptions.dart';
import 'package:fastex/core/errors/failures.dart';
import 'package:fastex/core/network/network_info.dart';
import 'package:fastex/src/features/Homepage/data/Data_Sources/localDS.dart';
import 'package:fastex/src/features/Homepage/data/Data_Sources/remoteDS.dart';
import 'package:fastex/src/features/Homepage/data/models/LandingModels.dart';
import 'package:fastex/src/features/Homepage/data/repositories/landingRepoImpl.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements LandingRemoteDataSource {}

class MockLocalDataSource extends Mock implements LandingLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  LandingRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = LandingRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group("device is [ONLINE]", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group("device is [OFFLINE]", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group("getSpecificFoodData", () {
    const testNumber = 1;
    const testName = "testName";
    final testLandingModel = LandingModel(
        name: testName, extraData: 'test trivia', price: testNumber, image: "");
    final Landing testLanding = testLandingModel;
    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arange
          when(mockRemoteDataSource.getSpecificFoodData(testName))
              .thenAnswer((_) async => testLandingModel);
          // act
          final result = await repository.getSpecificFoodData(testName);
          // assert
          verify(mockRemoteDataSource.getSpecificFoodData(testName));
          expect(result, equals(Right(testLanding)));
        },
      );

      test(
        'should return [ServerFailure] when the call to remote data source is unsuccessful',
        () async {
          // arange
          when(mockRemoteDataSource.getSpecificFoodData(testName))
              .thenThrow(ServerException());
          // act
          final result = await repository.getSpecificFoodData(testName);
          // assert
          verify(mockRemoteDataSource.getSpecificFoodData(testName));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arange
          when(mockLocalDataSource.getLastFoodData())
              .thenAnswer((_) async => testLandingModel);
          // act
          final result = await repository.getSpecificFoodData(testName);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastFoodData());
          expect(result, equals(Right(testLandingModel)));
        },
      );

      test(
        'should return [CacheFailure] when there is no cached data present',
        () async {
          // arange
          when(mockLocalDataSource.getLastFoodData())
              .thenThrow(CacheException());
          // act
          final result = await repository.getSpecificFoodData(testName);
          // assert
          verify(mockLocalDataSource.getLastFoodData());
          verifyNoMoreInteractions(mockLocalDataSource);
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });

  group('getAllFoodData', () {
    const testNumber = 1;
    const testName = "testName";
    final testLandingModel = LandingModel(
        name: testName, extraData: 'test trivia', price: testNumber, image: "");
    final Landing testLanding = testLandingModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getAllFoodData();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllFoodData())
              .thenAnswer((_) async => testLandingModel);
          // act
          final result = await repository.getAllFoodData();
          // assert
          verify(mockRemoteDataSource.getAllFoodData());
          expect(result, equals(Right(testLandingModel)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllFoodData())
              .thenAnswer((_) async => testLandingModel);
          // act
          final result = await repository.getAllFoodData();
          // assert
          verify(mockRemoteDataSource.getAllFoodData());
          verify(mockLocalDataSource.cacheFoodData(testLandingModel));
          // expect(result, equals(Right(testLandingModel)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllFoodData())
              .thenThrow(ServerException());
          // act
          final result = await repository.getAllFoodData();
          // assert
          verify(mockRemoteDataSource.getAllFoodData());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastFoodData())
              .thenAnswer((_) async => testLandingModel);
          // act
          final result = await repository.getAllFoodData();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastFoodData());
          expect(result, equals(Right(testLandingModel)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastFoodData())
              .thenThrow(CacheException());
          // act
          final result = await repository.getAllFoodData();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastFoodData());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
