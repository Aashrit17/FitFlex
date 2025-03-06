import 'package:fitflex/features/progress/presentation/view_model/progress_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Progress History'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProgressBloc, ProgressState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
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

            if (state.progress.isEmpty) {
              return const Center(
                child: Text(
                  'No progress data found.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return ListView.builder(
              itemCount: state.progress.length,
              itemBuilder: (context, index) {
                final progress = state.progress[index];
                return Card(
                  color: Colors.grey[900],
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ExpansionTile(
                    title: Text(
                      'User ID: ${progress.userId}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Goal Calories: ${progress.goalCalories} kcal',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    children: progress.progressHistory.map((entry) {
                      return ListTile(
                        title: Text(
                          DateFormat('yyyy-MM-dd').format(entry.date),
                          style: const TextStyle(color: Colors.purpleAccent),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _infoText(
                                'Water Intake', '${entry.waterIntake} ml'),
                            _infoText('Exercise',
                                '${entry.exerciseName} (${entry.exerciseMinutes} mins)'),
                            _infoText('Calories Consumed',
                                '${entry.caloriesConsumed} kcal'),
                            _infoText('Food', entry.foodName),
                            _infoText('Calories Burned',
                                '${entry.caloriesBurned} kcal'),
                            _infoText('Sleep Hours', '${entry.sleepHours} hrs'),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _infoText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        '$title: $value',
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
    );
  }
}
