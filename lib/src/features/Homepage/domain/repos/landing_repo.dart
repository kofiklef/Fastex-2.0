import 'package:dartz/dartz.dart';
import 'package:fastex/core/errors/failures.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';

abstract class LandingRepository {
  Future<Either<Failure, Landing>> getSpecificFoodData(int id);
  Future<Either<Failure, Landing>> getAllFoodData();
}
