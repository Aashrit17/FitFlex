// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllExerciseDTO _$GetAllExerciseDTOFromJson(Map<String, dynamic> json) =>
    GetAllExerciseDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => ExerciseApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllExerciseDTOToJson(GetAllExerciseDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
