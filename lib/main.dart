import 'package:fitflex/core/app_theme/app_theme.dart';
import 'package:fitflex/view/dashboard_view.dart';
import 'package:fitflex/view/login_view.dart';
import 'package:fitflex/view/onboarding_view.dart';
import 'package:fitflex/view/registration_view.dart';
import 'package:fitflex/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'font and theme',
      initialRoute: '/',
      theme: getApplicationTheme(),
      routes: {
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegistrationView(),
        '/dashboard': (context) => const DashboardView(),
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => const OnboardingView(),
      },
    );
  }
}
