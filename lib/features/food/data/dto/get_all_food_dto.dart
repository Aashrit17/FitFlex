import 'package:fitflex/features/food/data/model/food_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_food_dto.g.dart';

@JsonSerializable()
class GetAllFoodDTO {
  final List<FoodApiModel> data;

  GetAllFoodDTO({
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllFoodDTOToJson(this);

  factory GetAllFoodDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllFoodDTOFromJson(json);
}
