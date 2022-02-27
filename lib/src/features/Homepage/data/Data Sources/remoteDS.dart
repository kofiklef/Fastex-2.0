import 'package:fastex/src/features/Homepage/data/models/LandingModels.dart';

abstract class RemoteDataSource {
  /// Calls the http://fastexapi.azurewebsites.net/api/Products/GetProduct/{id} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LandingModel> getSpecificFoodData(int id);

  /// Calls the http://fastexapi.azurewebsites.net/api/Products/GetAllProducts endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LandingModel> getAllFoodData();

}