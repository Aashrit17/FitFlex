part of 'exercise_bloc.dart';


class ExerciseState extends Equatable {
  final List<ExerciseEntity> exercises;
  final bool isLoading;
  final String? error;

  const ExerciseState({
    required this.exercises,
    required this.isLoading,
    this.error,
  });

  factory ExerciseState.initial() {
    return const ExerciseState(
      exercises: [],
      isLoading: false,
    );
  }

  ExerciseState copyWith({
    List<ExerciseEntity>? exercises,
    bool? isLoading,
    String? error,
  }) {
    return ExerciseState(
      exercises: exercises ?? this.exercises,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [exercises, isLoading, error];
}