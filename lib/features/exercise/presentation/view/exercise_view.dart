import 'package:fitflex/features/exercise/presentation/view_model/exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();

  final TextEditingController _logExerciseNameController =
      TextEditingController();
  final TextEditingController _logDurationController = TextEditingController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Exercises'),
        backgroundColor: Colors.purple,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Manage Exercises'),
            Tab(text: 'Log Exercise'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _manageExercisesTab(),
          _logExerciseTab(),
        ],
      ),
    );
  }

  Widget _manageExercisesTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(_nameController, 'Exercise Name'),
          const SizedBox(height: 10),
          _buildTextField(
            _calorieController,
            'Calories Burned',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
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
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  );
                }

                if (state.error != null) {
                  return Center(
                    child: Text(
                      'Error: ${state.error}',
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  );
                }

                if (state.exercises.isEmpty) {
                  return const Center(
                    child: Text(
                      'No exercises found.',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = state.exercises[index];
                    return Card(
                      color: Colors.grey[900],
                      child: ListTile(
                        title: Text(
                          exercise.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${exercise.caloriesBPM} kcal burned',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit,
                                  color: Colors.deepPurpleAccent),
                              onPressed: () {
                                _showUpdateDialog(context, exercise.id!);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.redAccent),
                              onPressed: () {
                                context.read<ExerciseBloc>().add(
                                    DeleteExercise(exerciseId: exercise.id!));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _logExerciseTab() {
    String? selectedExerciseName;

    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.purple),
          );
        }

        if (state.error != null) {
          return Center(
            child: Text(
              'Error: ${state.error}',
              style: const TextStyle(color: Colors.redAccent),
            ),
          );
        }

        if (state.exercises.isEmpty) {
          return const Center(
            child: Text(
              'No exercises available to log.',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedExerciseName,
                dropdownColor: Colors.grey[900],
                decoration: const InputDecoration(
                  labelText: 'Select Exercise',
                  labelStyle: TextStyle(color: Colors.purple),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                items: state.exercises.map((exercise) {
                  return DropdownMenuItem<String>(
                    value: exercise.name,
                    child: Text(
                      exercise.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedExerciseName = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildTextField(
                _logDurationController,
                'Duration (minutes)',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (selectedExerciseName != null &&
                      _logDurationController.text.isNotEmpty) {
                    // TODO: Log the exercise (with selectedExerciseName and duration)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('$selectedExerciseName logged successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    setState(() {
                      selectedExerciseName = null;
                    });
                    _logDurationController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Please select an exercise and enter duration.'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
                child: const Text('Log Exercise'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.purple),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple, width: 2),
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
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Update Exercise',
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(updateNameController, 'New Exercise Name'),
              const SizedBox(height: 10),
              _buildTextField(
                updateCalorieController,
                'New Calories Burned',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (updateNameController.text.isNotEmpty &&
                    updateCalorieController.text.isNotEmpty) {
                  // Update logic
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
