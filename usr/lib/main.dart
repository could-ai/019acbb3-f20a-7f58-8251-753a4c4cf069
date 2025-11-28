import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/workout_list_screen.dart';
import 'screens/workout_detail_screen.dart';

void main() {
  runApp(const CyclingApp());
}

class CyclingApp extends StatelessWidget {
  const CyclingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cycling Analytics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        colorScheme: const ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.orangeAccent,
          surface: Color(0xFF1E1E1E),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 0,
          centerTitle: false,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/workouts': (context) => const WorkoutListScreen(),
        '/workout_detail': (context) => const WorkoutDetailScreen(),
      },
    );
  }
}
