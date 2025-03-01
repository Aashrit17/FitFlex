import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable {
  final String? id;
  final String name;
  final int caloriesBPM;

  const ExerciseEntity({
    this.id,
    required this.name,
    required this.caloriesBPM,
  });

  @override
  List<Object?> get props => [id, name, caloriesBPM];
}
