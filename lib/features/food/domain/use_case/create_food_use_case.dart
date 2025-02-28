import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitflex/app/usecase/usecase.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/food/domain/entity/food_entity.dart';
import 'package:fitflex/features/food/domain/repository/food_repository.dart';

class CreateFoodParams extends Equatable {
  final String foodName;
  final int foodCalorie;

  const CreateFoodParams({
    required this.foodName,
    required this.foodCalorie,
  });

  // Empty constructor
  const CreateFoodParams.empty()
      : foodName = '_empty.string',
        foodCalorie = 0;

  @override
  List<Object?> get props => [foodName];
}

class CreateFoodUseCase implements UsecaseWithParams<void, CreateFoodParams> {
  final IFoodRepository foodRepository;

  CreateFoodUseCase({required this.foodRepository});

  @override
  Future<Either<Failure, void>> call(CreateFoodParams params) async {
    return await foodRepository.createFood(
      FoodEntity(
        name: params.foodName,
        calorie: params.foodCalorie,
      ),
    );
  }
}
