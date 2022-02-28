import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fastex/core/errors/failures.dart';
import 'package:fastex/core/utils/usecases.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:fastex/src/features/Homepage/domain/repos/landing_repo.dart';
// import 'package:fastex/src/features/Homepage/domain/repos/landing_repo.dart';
import 'package:flutter/material.dart';

class GetSpecificFoodData extends UseCase<Landing, Params> {
  final LandingRepository repository;
  GetSpecificFoodData(this.repository);
  @override
  Future<Either<Failure, Landing>> call(Params params) async {
    return await repository.getSpecificFoodData(params.name);
  }
}

class Params extends Equatable {
  final String name;
  const Params({@required this.name});

  @override
  List<Object> get props => [id];
}
