import 'package:fitflex/app/di/di.dart';
import 'package:fitflex/core/theme/app_theme.dart';
import 'package:fitflex/features/splash/presentation/view/splash_screen_view.dart';
import 'package:fitflex/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management',
      theme: getApplicationTheme(),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: const SplashScreen(),
      ),
    );
  }
}
