import 'package:dartz/dartz.dart';
import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:fastex/src/features/Homepage/domain/repos/landing_repo.dart';
import 'package:fastex/src/features/Homepage/domain/usecase/getSpecificFoodData.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLandingRepository extends Mock implements LandingRepository {}

void main() {
  GetSpecificFoodData usecase;
  MockLandingRepository mockLandingRepository;

  setUp(() {
    mockLandingRepository = MockLandingRepository();
    usecase = GetSpecificFoodData(mockLandingRepository);
  });
  const testID = 1;
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
    "should get Food Data from the repository",
    () async {
      when(mockLandingRepository.getSpecificFoodData(any))
          .thenAnswer((_) async => const Right(testLanding));
      final result = await usecase(const Params(id: testID));
      expect(result, const Right(testLanding));
      verify(mockLandingRepository.getSpecificFoodData(testID));
      verifyNoMoreInteractions(mockLandingRepository);
    },
  );
}
