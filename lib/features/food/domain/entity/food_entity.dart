import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final String? id;
  final String name;
  final int calorie;

  const FoodEntity({
    this.id,
    required this.name,
    required this.calorie,
  });

  @override
  List<Object?> get props => [id, name, calorie];
}
