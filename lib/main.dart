import 'package:fitflex/app/app.dart';
import 'package:fitflex/app/di/di.dart';
import 'package:fitflex/core/network/hive_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    const MyApp(),
  );
}
