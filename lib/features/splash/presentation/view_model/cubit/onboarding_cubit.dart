import 'package:fitflex/app/di/di.dart';
import 'package:fitflex/features/auth/presentation/view/login_view.dart';
import 'package:fitflex/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:fitflex/features/dashboard/presentation/view_model/home_state.dart';
import 'package:fitflex/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<HomeState> {
  OnboardingCubit() : super(HomeState.initial());

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void goToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 0), () async {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: getIt<LoginBloc>(),
              child: const LoginView(),
            ),
          ),
        );
      }
    });
  }
}
