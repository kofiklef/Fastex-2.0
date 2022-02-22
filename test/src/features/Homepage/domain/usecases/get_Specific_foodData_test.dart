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
  final testPrice = 20;
  final testName = "testName";
  final testImage = "testImage";
  final testLanding = Landing(
      name: testName,
      extraData: "extraData",
      price: testPrice,
      image: testImage);

  test(
    "should get Food Data from the repository",
    () async {
      when(mockLandingRepository.getSpecificFoodData(any))
          .thenAnswer((_) async => Right(testLanding));
      final result = await usecase.execute(name: testName);
      expect(result, Right(testLanding));
      verify(mockLandingRepository.getSpecificFoodData(testName));
      verifyNoMoreInteractions(mockLandingRepository);
    },
  );
}
