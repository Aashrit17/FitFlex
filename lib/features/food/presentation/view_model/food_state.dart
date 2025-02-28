part of 'food_bloc.dart';


class FoodState extends Equatable {
  final List<FoodEntity> foods;
  final bool isLoading;
  final String? error;

  const FoodState({
    required this.foods,
    required this.isLoading,
    this.error,
  });

  factory FoodState.initial() {
    return const FoodState(
      foods: [],
      isLoading: false,
    );
  }

  FoodState copyWith({
    List<FoodEntity>? foods,
    bool? isLoading,
    String? error,
  }) {
    return FoodState(
      foods: foods ?? this.foods,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [foods, isLoading, error];
}