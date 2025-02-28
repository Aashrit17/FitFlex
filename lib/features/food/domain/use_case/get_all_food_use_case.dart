import 'package:dartz/dartz.dart';
import 'package:fitflex/app/usecase/usecase.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/food/domain/entity/food_entity.dart';
import 'package:fitflex/features/food/domain/repository/food_repository.dart';

class GetAllFoodUseCase implements UsecaseWithoutParams<List<FoodEntity>> {
  final IFoodRepository foodRepository;

  GetAllFoodUseCase({required this.foodRepository});

  @override
  Future<Either<Failure, List<FoodEntity>>> call() {
    print('GetAllFoodUseCase called');
    return foodRepository.getFoods();
  }
}