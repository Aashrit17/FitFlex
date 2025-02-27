import 'package:fitflex/core/common/snackbar/my_snackbar.dart';
import 'package:fitflex/features/home/presentation/view_model/home_cubit.dart';
import 'package:fitflex/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white), // White text for contrast
        ),
        centerTitle: true,
        backgroundColor: Colors.purple, // Purple AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              showMySnackBar(
                context: context,
                message: 'Logging out...',
                color: Colors.red,
              );

              context.read<HomeCubit>().logout(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return Container(
          color: Colors.black, // Ensures body has black background
          child: state.views.elementAt(state.selectedIndex),
        );
      }),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.purple, // Ensures bottom navigation is purple
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType
                  .fixed, // Ensures background color is applied
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Food',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Exercise',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Progress',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Account',
                ),
              ],
              backgroundColor:
                  Colors.purple, // Explicitly set background to purple
              currentIndex: state.selectedIndex,
              selectedItemColor: Colors.black, // White selected item
              unselectedItemColor: Colors.white, // Grey unselected items
              onTap: (index) {
                context.read<HomeCubit>().onTabTapped(index);
              },
            ),
          );
        },
      ),
    );
  }
}
