// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProgressDTO _$GetAllProgressDTOFromJson(Map<String, dynamic> json) =>
    GetAllProgressDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => ProgressApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProgressDTOToJson(GetAllProgressDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
