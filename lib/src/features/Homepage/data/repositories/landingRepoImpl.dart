// ignore_for_file: prefer_generic_function_type_aliases

import 'package:dartz/dartz.dart';
import 'package:fastex/core/errors/exceptions.dart';
import 'package:fastex/core/errors/failures.dart';
import 'package:fastex/core/network/network_info.dart';
import 'package:fastex/src/features/Homepage/data/Data_Sources/localDS.dart';
import 'package:fastex/src/features/Homepage/data/Data_Sources/remoteDS.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:fastex/src/features/Homepage/domain/repos/landing_repo.dart';
import 'package:flutter/material.dart';

typedef Future<Landing> _ConcreteOrRandomChooser();

class LandingRepositoryImpl implements LandingRepository {
  final LandingRemoteDataSource remoteDataSource;
  final LandingLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LandingRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Landing>> getSpecificFoodData(int id) async {
    return await _getFood(() {
      return remoteDataSource.getSpecificFoodData(id);
    });
  }

  @override
  Future<Either<Failure, Landing>> getAllFoodData() async {
    return await _getFood(() {
      return remoteDataSource.getAllFoodData();
    });
  }

  Future<Either<Failure, Landing>> _getFood(
      _ConcreteOrRandomChooser getSpecificOrAll) async {
    if (await networkInfo.isConnected) {
      try {
        networkInfo.isConnected;
        final remoteFood = await getSpecificOrAll();
        localDataSource.cacheFoodData(remoteFood);
        return Right(remoteFood);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final loaclFood = await localDataSource.getLastFoodData();
        return Right(loaclFood);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
