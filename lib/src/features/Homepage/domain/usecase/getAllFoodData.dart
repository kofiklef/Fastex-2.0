import 'package:dartz/dartz.dart';
import 'package:fastex/core/errors/failures.dart';
import 'package:fastex/core/utils/usecases.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:fastex/src/features/Homepage/domain/repos/landing_repo.dart';

class  GetAllFoodData extends UseCase<Landing, NoParams> {
  final LandingRepository repository;

  GetAllFoodData(this.repository);

  @override
  Future<Either<Failure, Landing>> call(NoParams params) async {
    return await repository.getAllFoodData();
  }
}
