import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/food/domain/entity/food_entity.dart';


abstract interface class IFoodRepository {
  Future<Either<Failure, List<FoodEntity>>> getFoods();
  Future<Either<Failure, void>> createFood(FoodEntity item);
  Future<Either<Failure, void>> deleteFood(String id, String? token);
}