import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:fitflex/features/exercise/domain/entity/exercise_entity.dart';
import 'package:fitflex/features/progress/domain/entity/progress_entity.dart';
import 'package:fitflex/features/progress/domain/use_case/get_all_progress_use_case.dart';

import 'package:flutter/foundation.dart';

part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  
  final GetAllProgressUseCase _getAllProgressUseCase;

  ProgressBloc({
    required GetAllProgressUseCase getAllProgressUseCase,
  })  : 
        _getAllProgressUseCase = getAllProgressUseCase,
        super(ProgressState.initial()) {
    on<LoadProgress>(_onLoadProgress);

    add(LoadProgress());
  }

  Future<void> _onLoadProgress(
      LoadProgress event, Emitter<ProgressState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllProgressUseCase.call();
    print('Result: $result');
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (progress) =>
          emit(state.copyWith(isLoading: false, progress: progress)),
    );
  }


}
