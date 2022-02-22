import 'package:dartz/dartz.dart';
import 'package:fastex/core/errors/failures.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:fastex/src/features/Homepage/domain/repos/landing_repo.dart';
import 'package:flutter/material.dart';

class GetSpecificFoodData {
  final LandingRepository repository;
  GetSpecificFoodData(this.repository);

  Future<Either<Failure, Landing>> execute({@required String name}) async {
    return await repository.getSpecificFoodData(name);
  }
}
