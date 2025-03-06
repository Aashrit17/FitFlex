import 'package:equatable/equatable.dart';

class ProgressEntryEntity extends Equatable {
  final DateTime date;
  final int waterIntake; // ml
  final int exerciseMinutes; // minutes
  final String exerciseName;
  final int caloriesConsumed; // kcal
  final String? foodName;
  final int caloriesBurned; // kcal
  final int sleepHours; // hours

  const ProgressEntryEntity({
    required this.date,
    required this.waterIntake,
    required this.exerciseMinutes,
    required this.exerciseName,
    required this.caloriesConsumed,
    this.foodName,
    required this.caloriesBurned,
    required this.sleepHours,
  });

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

class ProgressEntity extends Equatable {
  final String? id;
  final String userId;
  final List<ProgressEntryEntity> progressHistory;
  final int goalCalories;

  const ProgressEntity({
    this.id,
    required this.userId,
    required this.progressHistory,
    required this.goalCalories,
  });

  @override
  List<Object?> get props => [id, userId, progressHistory, goalCalories];
}
