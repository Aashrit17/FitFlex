import 'package:equatable/equatable.dart';
import 'package:fitflex/features/food/domain/entity/food_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_api_model.g.dart';

@JsonSerializable()
class FoodApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? foodId;
  final String foodName;
  final int foodCalorie;

  const FoodApiModel({
    this.foodId,
    required this.foodName,
    required this.foodCalorie,
  });

  const FoodApiModel.empty()
      : foodId = '',
        foodName = '',
        foodCalorie = 0;

  // From Json , write full code without generator
  factory FoodApiModel.fromJson(Map<String, dynamic> json) {
    return FoodApiModel(
      foodId: json['_id']?.toString() ?? '',
      foodName: json['name']?.toString() ?? '',
      foodCalorie: json['calorie'] ?? 0,
    );
  }

  // To Json , write full code without generator
  Map<String, dynamic> toJson() {
    return {
      '_id': foodId,
      'name': foodName,
      'calorie': foodCalorie,
    };
  }

  // Convert API Object to Entity
  FoodEntity toEntity() => FoodEntity(
        id: foodId,
        name: foodName,
        calorie: foodCalorie,
      );

  // Convert Entity to API Object
  static FoodApiModel fromEntity(FoodEntity entity) => FoodApiModel(
        foodName: entity.name,
        foodCalorie: entity.calorie,
      );

  // Convert API List to Entity List
  static List<FoodEntity> toEntityList(List<FoodApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props =>
      [foodId, foodName, foodCalorie];
}
