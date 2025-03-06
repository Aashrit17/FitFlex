// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressApiModel _$ProgressApiModelFromJson(Map<String, dynamic> json) =>
    ProgressApiModel(
      progressId: json['_id'] as String?,
      userId: json['userId'] as String,
      progressHistory: (json['progressHistory'] as List<dynamic>)
          .map((e) => ProgressHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      goalCalories: (json['goalCalories'] as num).toInt(),
    );

Map<String, dynamic> _$ProgressApiModelToJson(ProgressApiModel instance) =>
    <String, dynamic>{
      '_id': instance.progressId,
      'userId': instance.userId,
      'progressHistory': instance.progressHistory,
      'goalCalories': instance.goalCalories,
    };

ProgressHistoryModel _$ProgressHistoryModelFromJson(
        Map<String, dynamic> json) =>
    ProgressHistoryModel(
      date: DateTime.parse(json['date'] as String),
      waterIntake: (json['waterIntake'] as num).toInt(),
      exerciseMinutes: (json['exerciseMinutes'] as num).toInt(),
      exerciseName: json['exerciseName'] as String,
      caloriesConsumed: (json['caloriesConsumed'] as num).toInt(),
      foodName: json['foodName'] as String,
      caloriesBurned: (json['caloriesBurned'] as num).toInt(),
      sleepHours: (json['sleepHours'] as num).toInt(),
    );

Map<String, dynamic> _$ProgressHistoryModelToJson(
        ProgressHistoryModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'waterIntake': instance.waterIntake,
      'exerciseMinutes': instance.exerciseMinutes,
      'exerciseName': instance.exerciseName,
      'caloriesConsumed': instance.caloriesConsumed,
      'foodName': instance.foodName,
      'caloriesBurned': instance.caloriesBurned,
      'sleepHours': instance.sleepHours,
    };
