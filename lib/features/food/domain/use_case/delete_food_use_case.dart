import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitflex/app/shared_prefs/token_shared_prefs.dart';
import 'package:fitflex/app/usecase/usecase.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/food/domain/repository/food_repository.dart';


class DeleteFoodParams extends Equatable {
  final String foodId;

  const DeleteFoodParams({required this.foodId});

  const DeleteFoodParams.empty() : foodId = '_empty.string';

  @override
  List<Object?> get props => [
        foodId,
      ];
}

class DeleteFoodUsecase implements UsecaseWithParams<void, DeleteFoodParams> {
  final IFoodRepository foodRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  DeleteFoodUsecase({
    required this.foodRepository,
    required this.tokenSharedPrefs,
  });

  @override
  Future<Either<Failure, void>> call(DeleteFoodParams params) async {
    // Get token from Shared Preferences and send it to the server
    final token = await tokenSharedPrefs.getToken();
    return token.fold((l) {
      return Left(l);
    }, (r) async {
      return await foodRepository.deleteFood(params.foodId, r);
    });
  }
}
