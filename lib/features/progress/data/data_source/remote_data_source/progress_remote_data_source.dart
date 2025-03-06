import 'package:dio/dio.dart';
import 'package:fitflex/app/constants/api_endpoints.dart';
import 'package:fitflex/features/progress/data/data_source/progress_data_source.dart';
import 'package:fitflex/features/progress/data/dto/get_all_progress_dto.dart';
import 'package:fitflex/features/progress/data/model/progress_api_model.dart';
import 'package:fitflex/features/progress/domain/entity/progress_entity.dart';

class ProgressRemoteDataSource implements IProgressDataSource {
  final Dio _dio;

  ProgressRemoteDataSource(this._dio);

  @override
  Future<void> createProgress(ProgressEntity progress) async {
    try {
      // Convert entity to model
      var progressApiModel = ProgressApiModel.fromEntity(progress);
      var response = await _dio.post(
        ApiEndpoints.createProgress,
        data: progressApiModel.toJson(),
      );
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ProgressHistoryEntity>> getProgress(String id) async {
    try {
      var response = await _dio.get(
        '${ApiEndpoints.getAllProgress}$id',
      );

      GetAllProgressDTO progressDTO = GetAllProgressDTO.fromJson(response.data);
      return ProgressApiModel.toEntityList(progressDTO.data);
    } on DioException catch (e) {
      throw Exception((e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
