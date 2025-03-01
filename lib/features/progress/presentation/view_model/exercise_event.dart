part of 'exercise_bloc.dart';




@immutable
sealed class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}

final class LoadExercise extends ExerciseEvent {}

class LoadImage extends ExerciseEvent {
  final File file;

  const LoadImage({
    required this.file,
  });
}



final class AddExercise extends ExerciseEvent {
  final String exerciseName;
  final int exerciseCalorie;

  const AddExercise({required this.exerciseName, required this.exerciseCalorie});

  @override
  List<Object> get props => [exerciseName, exerciseCalorie];
}

final class DeleteExercise extends ExerciseEvent {
  final String exerciseId;

  const DeleteExercise({required this.exerciseId});

  @override
  List<Object> get props => [exerciseId];
}
