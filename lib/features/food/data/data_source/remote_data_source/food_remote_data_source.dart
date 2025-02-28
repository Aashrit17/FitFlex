import 'package:dio/dio.dart';
import 'package:fitflex/app/constants/api_endpoints.dart';
import 'package:fitflex/features/food/data/data_source/food_data_source.dart';
import 'package:fitflex/features/food/data/dto/get_all_food_dto.dart';
import 'package:fitflex/features/food/data/model/food_api_model.dart';
import 'package:fitflex/features/food/domain/entity/food_entity.dart';


class FoodRemoteDataSource implements IFoodDataSource {
  final Dio _dio;

  FoodRemoteDataSource(this._dio);

  @override
  Future<void> createFood(FoodEntity food) async {
    try {
      // Convert entity to model
      var foodApiModel = FoodApiModel.fromEntity(food);
      var response = await _dio.post(
        ApiEndpoints.createFood,
        data: foodApiModel.toJson(),
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
  Future<void> deleteFood(String id, String? token) async {
    try {
      var response = await _dio.delete(
        ApiEndpoints.deleteFood + id,
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
  Future<List<FoodEntity>> getFoods() async {
    try {
      var response = await _dio.get(
        ApiEndpoints.getAllFood,
      );

      GetAllFoodDTO foodDTO = GetAllFoodDTO.fromJson(response.data);
      return FoodApiModel.toEntityList(foodDTO.data);
    } on DioException catch (e) {
      throw Exception((e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}