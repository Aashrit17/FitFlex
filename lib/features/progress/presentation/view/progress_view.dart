import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  List<dynamic> progressData = []; // Initialize as an empty list

  Future<void> fetchUserProgress() async {
    const userId = '67c40b9a2d032af832aebfd0';
    final response = await http
        .get(Uri.parse('http://10.0.2.2:3000/api/v1/progress/$userId'));

    if (response.statusCode == 200) {
      setState(() {
        // Reverse the list to show the most recent data on top
        progressData = (json.decode(response.body)['data'] ?? [])
            .reversed
            .toList(); // Reversing the list to show the latest entries first
      });
    } else {
      throw Exception('Failed to load user progress data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserProgress(); // Fetch user progress on init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Progress'),
        backgroundColor: Colors.purple, // Purple color for app bar
      ),
      backgroundColor: Colors.black, // Black background for entire page
      body: progressData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.purple), // Purple loading spinner
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final progressEntry = progressData[index];

                      // Safely extract data with fallback values
                      final exerciseName =
                          progressEntry['exerciseName'] ?? 'No Exercise';
                      final foodName =
                          progressEntry['foodName'] ?? 'No Food Logged';
                      final waterIntake = progressEntry['waterIntake'] ?? 0;
                      final exerciseMinutes =
                          progressEntry['exerciseMinutes'] ?? 0;
                      final caloriesConsumed =
                          progressEntry['caloriesConsumed'] ?? 0;
                      final caloriesBurned =
                          progressEntry['caloriesBurned'] ?? 0;
                      final sleepHours = progressEntry['sleepHours'] ?? 0;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.grey[850], // Dark gray card background
                          elevation: 4,
                          child: ListTile(
                            title: Text(
                              'Date: ${progressEntry['date']}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Exercise: $exerciseName',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                Text('Food: $foodName',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                Text('Water Intake: ${waterIntake}ml',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                Text('Exercise Minutes: $exerciseMinutes',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                Text('Calories Consumed: $caloriesConsumed',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                Text('Calories Burned: $caloriesBurned',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                Text('Sleep Hours: $sleepHours',
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount:
                        progressData.length, // Provide the correct count
                  ),
                ),
              ],
            ),
    );
  }
}
