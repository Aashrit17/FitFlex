import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitflex/features/food/domain/entity/food_entity.dart';
import 'package:fitflex/features/food/domain/use_case/create_food_use_case.dart';
import 'package:fitflex/features/food/domain/use_case/delete_food_use_case.dart';
import 'package:fitflex/features/food/domain/use_case/get_all_food_use_case.dart';

import 'package:flutter/foundation.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final CreateFoodUseCase _createFoodUseCase;
  final GetAllFoodUseCase _getAllFoodUseCase;
  final DeleteFoodUsecase _deleteFoodUsecase;

  FoodBloc({
    required CreateFoodUseCase createFoodUseCase,
    required GetAllFoodUseCase getAllFoodUseCase,
    required DeleteFoodUsecase deleteFoodUsecase,
  })  : _createFoodUseCase = createFoodUseCase,
        _getAllFoodUseCase = getAllFoodUseCase,
        _deleteFoodUsecase = deleteFoodUsecase,
        super(FoodState.initial()) {
    on<LoadFood>(_onLoadFood);
    on<AddFood>(_onAddFood);
    on<DeleteFood>(_onDeleteFood);

    add(LoadFood());
  }

  Future<void> _onLoadFood(LoadFood event, Emitter<FoodState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllFoodUseCase.call();
    print('Result: $result');
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (foods) => emit(state.copyWith(isLoading: false, foods: foods)),
    );
  }

  Future<void> _onAddFood(AddFood event, Emitter<FoodState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createFoodUseCase.call(CreateFoodParams(
        foodName: event.foodName,
        foodCalorie: event.foodCalorie,
        ));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (foods) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadFood());
      },
    );
  }

  Future<void> _onDeleteFood(DeleteFood event, Emitter<FoodState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result =
        await _deleteFoodUsecase.call(DeleteFoodParams(foodId: event.foodId));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (batches) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadFood());
      },
    );
  }
}