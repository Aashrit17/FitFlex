import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitflex/features/exercise/domain/entity/exercise_entity.dart';
import 'package:fitflex/features/exercise/domain/use_case/create_exercise_use_case%20copy.dart';
import 'package:fitflex/features/exercise/domain/use_case/delete_exercise_use_case%20copy%202.dart';
import 'package:fitflex/features/exercise/domain/use_case/get_all_exercise_use_case.dart';

import 'package:flutter/foundation.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final CreateExerciseUseCase _createExerciseUseCase;
  final GetAllExerciseUseCase _getAllExerciseUseCase;
  final DeleteExerciseUsecase _deleteExerciseUsecase;

  ExerciseBloc({
    required CreateExerciseUseCase createExerciseUseCase,
    required GetAllExerciseUseCase getAllExerciseUseCase,
    required DeleteExerciseUsecase deleteExerciseUsecase,
  })  : _createExerciseUseCase = createExerciseUseCase,
        _getAllExerciseUseCase = getAllExerciseUseCase,
        _deleteExerciseUsecase = deleteExerciseUsecase,
        super(ExerciseState.initial()) {
    on<LoadExercise>(_onLoadExercise);
    on<AddExercise>(_onAddExercise);
    on<DeleteExercise>(_onDeleteExercise);

    add(LoadExercise());
  }

  Future<void> _onLoadExercise(
      LoadExercise event, Emitter<ExerciseState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllExerciseUseCase.call();
    print('Result: $result');
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (exercises) =>
          emit(state.copyWith(isLoading: false, exercises: exercises)),
    );
  }

  Future<void> _onAddExercise(
      AddExercise event, Emitter<ExerciseState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createExerciseUseCase.call(CreateExerciseParams(
      exerciseName: event.exerciseName,
      exerciseCalorie: event.exerciseCalorie,
    ));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (Exercises) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadExercise());
      },
    );
  }

  Future<void> _onDeleteExercise(
      DeleteExercise event, Emitter<ExerciseState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _deleteExerciseUsecase
        .call(DeleteExerciseParams(exerciseId: event.exerciseId));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (batches) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadExercise());
      },
    );
  }
}
