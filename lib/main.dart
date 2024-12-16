import 'package:fitflex/view/dashboard_view.dart';
import 'package:fitflex/view/login_view.dart';
import 'package:fitflex/view/onboarding_view.dart';
import 'package:fitflex/view/registration_view.dart';
import 'package:fitflex/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginView(),
        '/register': (context) => RegistrationView(),
        '/dashboard': (context) => DashboardView(),
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingView(),
      },
    );
  }
}
