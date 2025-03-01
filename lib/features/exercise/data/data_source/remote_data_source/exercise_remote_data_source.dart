import 'package:dio/dio.dart';
import 'package:fitflex/app/constants/api_endpoints.dart';
import 'package:fitflex/features/exercise/data/data_source/exercise_data_source.dart';
import 'package:fitflex/features/exercise/data/dto/get_all_exercise_dto.dart';
import 'package:fitflex/features/exercise/data/model/exercise_api_model.dart';
import 'package:fitflex/features/exercise/domain/entity/exercise_entity.dart';


class ExerciseRemoteDataSource implements IExerciseDataSource {
  final Dio _dio;

  ExerciseRemoteDataSource(this._dio);

  @override
  Future<void> createExercise(ExerciseEntity exercise) async {
    try {
      // Convert entity to model
      var exerciseApiModel = ExerciseApiModel.fromEntity(exercise);
      var response = await _dio.post(
        ApiEndpoints.createExercise,
        data: exerciseApiModel.toJson(),
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
  Future<void> deleteExercise(String id, String? token) async {
    try {
      var response = await _dio.delete(
        ApiEndpoints.deleteExercise + id,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
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
  Future<List<ExerciseEntity>> getExercises() async {
    try {
      var response = await _dio.get(
        ApiEndpoints.getAllExercise,
      );

      GetAllExerciseDTO exerciseDTO = GetAllExerciseDTO.fromJson(response.data);
      return ExerciseApiModel.toEntityList(exerciseDTO.data);
    } on DioException catch (e) {
      throw Exception((e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}