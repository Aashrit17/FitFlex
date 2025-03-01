// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseApiModel _$ExerciseApiModelFromJson(Map<String, dynamic> json) =>
    ExerciseApiModel(
      exerciseId: json['_id'] as String?,
      exerciseName: json['exerciseName'] as String,
      exerciseCalorie: (json['exerciseCalorie'] as num).toInt(),
    );

Map<String, dynamic> _$ExerciseApiModelToJson(ExerciseApiModel instance) =>
    <String, dynamic>{
      '_id': instance.exerciseId,
      'exerciseName': instance.exerciseName,
      'exerciseCalorie': instance.exerciseCalorie,
    };
