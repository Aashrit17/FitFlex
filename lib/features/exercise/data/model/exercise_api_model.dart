import 'package:equatable/equatable.dart';
import 'package:fitflex/features/exercise/domain/entity/exercise_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_api_model.g.dart';

@JsonSerializable()
class ExerciseApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? exerciseId;
  final String exerciseName;
  final int exerciseCalorie;

  const ExerciseApiModel({
    this.exerciseId,
    required this.exerciseName,
    required this.exerciseCalorie,
  });

  const ExerciseApiModel.empty()
      : exerciseId = '',
        exerciseName = '',
        exerciseCalorie = 0;

  // From Json , write full code without generator
  factory ExerciseApiModel.fromJson(Map<String, dynamic> json) {
    return ExerciseApiModel(
      exerciseId: json['_id']?.toString() ?? '',
      exerciseName: json['name']?.toString() ?? '',
      exerciseCalorie: json['caloriesBurnedPerMinute'] ?? 0,
    );
  }

  // To Json , write full code without generator
  Map<String, dynamic> toJson() {
    return {
      '_id': exerciseId,
      'name': exerciseName,
      'caloriesBurnedPerMinute': exerciseCalorie,
    };
  }

  // Convert API Object to Entity
  ExerciseEntity toEntity() => ExerciseEntity(
        id: exerciseId,
        name: exerciseName,
        caloriesBPM: exerciseCalorie,
      );

  // Convert Entity to API Object
  static ExerciseApiModel fromEntity(ExerciseEntity entity) => ExerciseApiModel(
        exerciseName: entity.name,
        exerciseCalorie: entity.caloriesBPM,
      );

  // Convert API List to Entity List
  static List<ExerciseEntity> toEntityList(List<ExerciseApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [exerciseId, exerciseName, exerciseCalorie];
}
