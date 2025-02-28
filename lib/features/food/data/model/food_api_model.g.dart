// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodApiModel _$FoodApiModelFromJson(Map<String, dynamic> json) => FoodApiModel(
      foodId: json['_id'] as String?,
      foodName: json['foodName'] as String,
      foodCalorie: (json['foodCalorie'] as num).toInt(),
    );

Map<String, dynamic> _$FoodApiModelToJson(FoodApiModel instance) =>
    <String, dynamic>{
      '_id': instance.foodId,
      'foodName': instance.foodName,
      'foodCalorie': instance.foodCalorie,
    };
