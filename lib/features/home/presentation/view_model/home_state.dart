import 'package:equatable/equatable.dart';
import 'package:fitflex/app/di/di.dart';
import 'package:fitflex/features/exercise/presentation/view/exercise_view.dart';
import 'package:fitflex/features/exercise/presentation/view_model/exercise_bloc.dart';
import 'package:fitflex/features/food/presentation/view/food_view.dart';
import 'package:fitflex/features/food/presentation/view_model/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        BlocProvider(
          create: (context) => getIt<FoodBloc>(),
          child: FoodPage(),
        ),
        BlocProvider(
          create: (context) => getIt<ExerciseBloc>(),
          child: const ExercisePage(),
        ),
        const Center(
          child: Text('Progress'),
        ),
        const Center(
          child: Text('Account'),
        ),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
