import 'package:fastex/src/features/Homepage/data/models/LandingModels.dart';

abstract class LandingLocalDataSource {
  // Gets the cached [LandingModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.

  Future<LandingModel> getLastFoodData();
  Future<void> cacheFoodData(LandingModel foodToCache);
  
}
