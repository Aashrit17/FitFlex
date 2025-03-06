import 'package:fitflex/features/progress/data/model/progress_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_progress_dto.g.dart';

@JsonSerializable()
class GetAllProgressDTO {
  // final bool success;
  // final int count;
  final List<ProgressApiModel> data;

  GetAllProgressDTO({
    // required this.success,
    // required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllProgressDTOToJson(this);

  factory GetAllProgressDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllProgressDTOFromJson(json);
}
