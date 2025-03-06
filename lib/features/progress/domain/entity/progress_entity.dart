import 'package:equatable/equatable.dart';

class ProgressEntity extends Equatable {
  final String userId;
  final List<ProgressHistoryEntity> progressHistory;
  final int goalCalories;

  const ProgressEntity({
    required this.userId,
    required this.progressHistory,
    required this.goalCalories,
  });

  @override
  List<Object?> get props => [userId, progressHistory, goalCalories];
}

class ProgressHistoryEntity extends Equatable {
  final DateTime date;
  final int waterIntake;
  final int exerciseMinutes;
  final String exerciseName;
  final int caloriesConsumed;
  final String foodName;
  final int caloriesBurned;
  final int sleepHours;

  const ProgressHistoryEntity({
    required this.date,
    required this.waterIntake,
    required this.exerciseMinutes,
    required this.exerciseName,
    required this.caloriesConsumed,
    required this.foodName,
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
