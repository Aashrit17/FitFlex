import 'package:fitflex/features/exercise/presentation/view_model/exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Exercises')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Exercise Name'),
            ),
            TextField(
              controller: _calorieController,
              decoration: const InputDecoration(labelText: 'Calories Burned'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _calorieController.text.isNotEmpty) {
                  context.read<ExerciseBloc>().add(
                        AddExercise(
                          exerciseName: _nameController.text,
                          exerciseCalorie: int.parse(_calorieController.text),
                        ),
                      );
                  _nameController.clear();
                  _calorieController.clear();
                }
              },
              child: const Text('Add Exercise'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ExerciseBloc, ExerciseState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.error != null) {
                    return Center(child: Text('Error: ${state.error}'));
                  }

                  if (state.exercises.isEmpty) {
                    return const Center(child: Text('No exercises found.'));
                  }

                  return ListView.builder(
                    itemCount: state.exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = state.exercises[index];
                      return ListTile(
                        title: Text(exercise.name),
                        subtitle: Text('${exercise.caloriesBPM} kcal burned'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _showUpdateDialog(context, exercise.id!);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                context.read<ExerciseBloc>().add(
                                    DeleteExercise(exerciseId: exercise.id!));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, String exerciseId) {
    TextEditingController updateNameController = TextEditingController();
    TextEditingController updateCalorieController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Exercise'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: updateNameController,
                decoration:
                    const InputDecoration(labelText: 'New Exercise Name'),
              ),
              TextField(
                controller: updateCalorieController,
                decoration:
                    const InputDecoration(labelText: 'New Calories Burned'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (updateNameController.text.isNotEmpty &&
                    updateCalorieController.text.isNotEmpty) {
                  // context.read<ExerciseBloc>().add(UpdateExercise(
                  //   exerciseId: exerciseId,
                  //   exerciseName: _updateNameController.text,
                  //   exerciseCalorie: int.parse(_updateCalorieController.text),
                  // ));

                  Navigator.pop(context);
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
