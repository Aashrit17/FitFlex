import 'package:fitflex/features/exercise/data/model/exercise_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_exercise_dto.g.dart';

@JsonSerializable()
class GetAllExerciseDTO {
  final bool success;
  final int count;
  final List<ExerciseApiModel> data;

  GetAllExerciseDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllExerciseDTOToJson(this);

  factory GetAllExerciseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllExerciseDTOFromJson(json);
}