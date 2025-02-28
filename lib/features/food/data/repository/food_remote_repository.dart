import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/food/data/data_source/remote_data_source/food_remote_data_source.dart';
import 'package:fitflex/features/food/domain/entity/food_entity.dart';
import 'package:fitflex/features/food/domain/repository/food_repository.dart';

class FoodRemoteRepository implements IFoodRepository {
  final FoodRemoteDataSource remoteDataSource;

  FoodRemoteRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> createFood(FoodEntity food) async {
    try {
      remoteDataSource.createFood(food);
      return Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteFood(String id, String? token) async {
    try {
      remoteDataSource.deleteFood(id, token);
      return Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<FoodEntity>>> getFoods() async {
    try {
      final foods = await remoteDataSource.getFoods();
      return Right(foods);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}