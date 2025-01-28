import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/colors.dart';
import 'package:todo/core/fonts.dart';
import 'package:todo/features/add_todo/presentation/screens/add_todo_screen.dart';
import 'package:todo/features/homescreen/presentation/screens/screen_home.dart';
import 'package:todo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.surface,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
        ),
        textTheme: const TextTheme(
          bodyLarge:
              TextStyle(color: AppColors.onSurface, fontFamily: Fonts.mainfont),
          bodyMedium:
              TextStyle(color: AppColors.onSurface, fontFamily: Fonts.mainfont),
        ),
      ),
      home: const AddTodoScreen(),
    );
  }
}
