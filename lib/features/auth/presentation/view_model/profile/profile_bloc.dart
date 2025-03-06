import 'package:equatable/equatable.dart';
import 'package:fitflex/app/di/di.dart';
import 'package:fitflex/app/shared_prefs/token_shared_prefs.dart';
import 'package:fitflex/features/auth/domain/entity/auth_entity.dart';
import 'package:fitflex/features/auth/domain/use_case/get_user_usecase.dart';
import 'package:fitflex/features/auth/domain/use_case/update_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserUsecase getUserUsecase;
  final UpdateUserUsecase updateUserUsecase;
  TokenSharedPrefs tokenSharedPrefs;
  ProfileBloc({
    required TokenSharedPrefs tokenSharedPrefs,
    required UpdateUserUsecase updateUserUsecase,
    required GetUserUsecase getUserUsecase,
  })  : tokenSharedPrefs = tokenSharedPrefs,
        getUserUsecase = getUserUsecase,
        updateUserUsecase = updateUserUsecase,
        super(
          const ProfileState.initial(),
        ) {
    on<NavigatetoProfile>((event, emit) {
      final profileBloc = getIt<ProfileBloc>();
      Navigator.pushReplacement(
        event.context,
        MaterialPageRoute(
          builder: (context) =>
              BlocProvider.value(value: profileBloc, child: event.destination),
        ),
      );
});
    on<UpdateUserEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final result = await updateUserUsecase.call(event.user);
        print('RESULT:: $result');
        result.fold(
          (failure) {
            emit(state.copyWith(isLoading: false, isSuccess: false));
          },
          (user) {
            emit(state.copyWith(
                isLoading: false,
                isSuccess: true,
                user: user)); // Emit the updated user state
          },
        );
      } catch (e) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        print("Exception occurred: $e");
      }
    });
  }

  // final userId = await _tokenHelper.getUserIdFromToken();
  // if (userId == null) {
  //   emit(const ProfileError("Client id not found"));
  //   return;
  // }

  Future<void> loadClient() async {
    emit(state.copyWith(isLoading: true));

    try {
      final result = await getUserUsecase.call();
      print('RESULT:::::: $result');
      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, isSuccess: false));
        },
        (user) {
          // print('USER::: $user');
          emit(state.copyWith(isLoading: false, user: user));
        },
      );
      //   },
    } catch (e) {
      emit(state.copyWith(isLoading: false, isSuccess: false));
      print("Exception occurred: $e");

      // return Left(e.toString());
    }
  }
}
