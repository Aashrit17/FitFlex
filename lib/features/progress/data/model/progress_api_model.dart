import 'package:equatable/equatable.dart';
import 'package:fitflex/features/progress/domain/entity/progress_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'progress_api_model.g.dart'; // This part will generate the .g.dart file

@JsonSerializable()
class ProgressApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? progressId;
  final String userId;
  final List<ProgressHistoryModel> progressHistory;
  final int goalCalories;

  const ProgressApiModel({
    this.progressId,
    required this.userId,
    required this.progressHistory,
    required this.goalCalories,
  });

  const ProgressApiModel.empty()
      : progressId = '',
        userId = '',
        progressHistory = const [],
        goalCalories = 2000;

  // From JSON (with generator)
  factory ProgressApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressApiModelFromJson(json);

  // To JSON (with generator)
  Map<String, dynamic> toJson() => _$ProgressApiModelToJson(this);

  // Convert API Object to Entity
  ProgressEntity toEntity() => ProgressEntity(
        userId: userId,
        progressHistory: progressHistory.map((e) => e.toEntity()).toList(),
        goalCalories: goalCalories,
      );

  // Convert Entity to API Object
  static ProgressApiModel fromEntity(ProgressEntity entity) => ProgressApiModel(
        progressId: '', // Assuming no progressId in the entity, adjust if needed
        userId: entity.userId,
        progressHistory: entity.progressHistory
            .map((e) => ProgressHistoryModel.fromEntity(e))
            .toList(),
        goalCalories: entity.goalCalories,
      );

  // Convert API List to Entity List
  static List<ProgressEntity> toEntityList(List<ProgressApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [progressId, userId, progressHistory, goalCalories];
}

@JsonSerializable()
class ProgressHistoryModel extends Equatable {
  final DateTime date;
  final int waterIntake;
  final int exerciseMinutes;
  final String exerciseName;
  final int caloriesConsumed;
  final String foodName;
  final int caloriesBurned;
  final int sleepHours;

  const ProgressHistoryModel({
    required this.date,
    required this.waterIntake,
    required this.exerciseMinutes,
    required this.exerciseName,
    required this.caloriesConsumed,
    required this.foodName,
    required this.caloriesBurned,
    required this.sleepHours,
  });

  // From JSON (with generator)
  factory ProgressHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressHistoryModelFromJson(json);

  // To JSON (with generator)
  Map<String, dynamic> toJson() => _$ProgressHistoryModelToJson(this);

  ProgressHistoryEntity toEntity() => ProgressHistoryEntity(
        date: date,
        waterIntake: waterIntake,
        exerciseMinutes: exerciseMinutes,
        exerciseName: exerciseName,
        caloriesConsumed: caloriesConsumed,
        foodName: foodName,
        caloriesBurned: caloriesBurned,
        sleepHours: sleepHours,
      );

  static ProgressHistoryModel fromEntity(ProgressHistoryEntity entity) =>
      ProgressHistoryModel(
        date: entity.date,
        waterIntake: entity.waterIntake,
        exerciseMinutes: entity.exerciseMinutes,
        exerciseName: entity.exerciseName,
        caloriesConsumed: entity.caloriesConsumed,
        foodName: entity.foodName,
        caloriesBurned: entity.caloriesBurned,
        sleepHours: entity.sleepHours,
      );

  @override
  List<Object?> get props => [
        date,
        waterIntake,
        exerciseMinutes,
        exerciseName,
        caloriesConsumed,
        foodName,
        caloriesBurned,
        sleepHours,
      ];
}
