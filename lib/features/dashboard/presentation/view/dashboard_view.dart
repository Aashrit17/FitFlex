// import 'package:fitflex/core/common/snackbar/my_snackbar.dart';
// import 'package:fitflex/features/dashboard/presentation/view_model/home_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DashboardView extends StatefulWidget {
//   const DashboardView({super.key});

//   @override
//   State<DashboardView> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<DashboardView> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     const DashboardScreen(),
//     const ProgressScreen(),
//     const SettingsScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FitFlex'),
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         actions: [
//           Switch(
//             value: false,
//             onChanged: (value) {
//               // Change theme
//               // setState(() {
//               //   _isDarkTheme = value;
//               // });
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.logout),
//             color: Colors.black,
//             onPressed: () {
//               // Logout code
//               showMySnackBar(
//                 context: context,
//                 message: 'Logging out...',
//                 color: Colors.red,
//               );

//               context.read<HomeCubit>().logout(context);
//             },
//           ),
//         ],
//       ),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         currentIndex: _currentIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard, color: Colors.deepPurple),
//             label: "Dashboard",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bar_chart, color: Colors.deepPurple),
//             label: "Progress",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings, color: Colors.deepPurple),
//             label: "Settings",
//           ),
//         ],
//         selectedItemColor: Colors.deepPurple,
//         unselectedItemColor: Colors.white70,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//       backgroundColor: Colors.black,
//     );
//   }
// }

// // Restored Dashboard Screen
// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.deepPurple,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Welcome Back, Admin!",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   "Keep pushing towards your fitness goals!",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.white70,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _buildStatCard("Steps", "10,245", Icons.directions_walk),
//               _buildStatCard(
//                   "Calories", "345 kcal", Icons.local_fire_department),
//               _buildStatCard("Workouts", "5", Icons.fitness_center),
//             ],
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             "Quick Actions",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _buildActionButton(context, Icons.add, "Log Workout"),
//               _buildActionButton(context, Icons.fastfood, "Log Meal"),
//               _buildActionButton(context, Icons.access_time, "Set Reminder"),
//             ],
//           ),
//           const Spacer(),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.deepPurple,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 16),
//             ),
//             onPressed: () {
//               print("Start Activity");
//             },
//             child: const Text(
//               "Start Activity",
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatCard(String title, String value, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.deepPurple.shade700,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black45,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Icon(icon, size: 32, color: Colors.white),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.white70,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildActionButton(BuildContext context, IconData icon, String label) {
//     return Column(
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//             color: Colors.deepPurple,
//             shape: BoxShape.circle,
//           ),
//           child: IconButton(
//             icon: Icon(icon, color: Colors.white),
//             onPressed: () {
//               print("$label tapped");
//             },
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12, color: Colors.white),
//         ),
//       ],
//     );
//   }
// }

// // Progress Screen with Progress Tracking
// class ProgressScreen extends StatelessWidget {
//   const ProgressScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const Text(
//             "Your Progress",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           _buildProgressIndicator("Weekly Steps", 7500, 10000),
//           const SizedBox(height: 20),
//           _buildProgressIndicator("Calories Burned", 1800, 2500),
//           const SizedBox(height: 20),
//           _buildProgressIndicator("Workouts Completed", 3, 5),
//         ],
//       ),
//     );
//   }

//   Widget _buildProgressIndicator(String title, int current, int goal) {
//     double progress = current / goal;

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.deepPurple.shade700,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black45,
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 8),
//           LinearProgressIndicator(
//             value: progress,
//             backgroundColor: Colors.deepPurple.shade200,
//             color: Colors.green,
//             minHeight: 10,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             "$current / $goal",
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.white70,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Settings Screen
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         "Settings Screen",
//         style: TextStyle(color: Colors.white, fontSize: 24),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData.dark(),
//     home: const DashboardView(),
//   ));
// }
