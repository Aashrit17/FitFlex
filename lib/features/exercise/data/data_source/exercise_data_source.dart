import 'package:fitflex/features/exercise/domain/entity/exercise_entity.dart';

abstract interface class IExerciseDataSource {
  Future<List<ExerciseEntity>> getExercises();
  Future<void> createExercise(ExerciseEntity exercise);
  Future<void> deleteExercise(String id, String? token);
}
