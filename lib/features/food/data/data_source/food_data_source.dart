import 'package:fitflex/features/food/domain/entity/food_entity.dart';

abstract interface class IFoodDataSource {
  Future<List<FoodEntity>> getFoods();
  Future<void> createFood(FoodEntity food);
  Future<void> deleteFood(String id, String? token);
}