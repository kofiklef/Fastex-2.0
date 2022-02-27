import 'package:dartz/dartz.dart';
import 'package:fastex/core/errors/failures.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:fastex/src/features/Homepage/domain/repos/landing_repo.dart';

class LandingRepositoryImpl implements LandingRepository {
  @override
  Future<Either<Failure, Landing>> getSpecificFoodData(int id) {
    return null;
  }

  @override
  Future<Either<Failure, Landing>> getAllFoodData() {
    // TODO: implement getAllFoodData
    return null;
  }
}
