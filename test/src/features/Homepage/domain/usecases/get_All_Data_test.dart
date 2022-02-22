
import 'package:dartz/dartz.dart';
import 'package:fastex/core/utils/usecases.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:fastex/src/features/Homepage/domain/repos/landing_repo.dart';
import 'package:fastex/src/features/Homepage/domain/usecase/getAllFoodData.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLandingRepository extends Mock implements LandingRepository {}

void main() {
  GetAllFoodData usecase;
  MockLandingRepository mockLandingRepository;

  setUp(() {
    mockLandingRepository = MockLandingRepository();
    usecase = GetAllFoodData(mockLandingRepository);
  });
  const testPrice = 20;
  const testName = "testName";
  const testImage = "testImage";
  const testLanding = Landing(
    name: testName,
    extraData: "extraData",
    price: testPrice,
    image: testImage,
  );

  test(
    "should get All Food Data from the repository",
    () async {
      when(mockLandingRepository.getAllFoodData())
          .thenAnswer((_) async => const Right(testLanding));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, const Right(testLanding));
      verify(mockLandingRepository.getAllFoodData());
      verifyNoMoreInteractions(mockLandingRepository);
    },
  );
}
