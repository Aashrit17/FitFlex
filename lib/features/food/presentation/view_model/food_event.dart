part of 'food_bloc.dart';


@immutable
sealed class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object> get props => [];
}

final class LoadFood extends FoodEvent {}

class LoadImage extends FoodEvent {
  final File file;

  const LoadImage({
    required this.file,
  });
}



final class AddFood extends FoodEvent {
  final String foodName;
  final int foodCalorie;

  const AddFood({required this.foodName, required this.foodCalorie});

  @override
  List<Object> get props => [foodName, foodCalorie];
}

final class DeleteFood extends FoodEvent {
  final String foodId;

  const DeleteFood({required this.foodId});

  @override
  List<Object> get props => [foodId];
}
