import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = Workout.getMockWorkouts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Workouts'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: workout.source == 'Zwift' ? Colors.orange : Colors.grey[800],
                child: Icon(
                  workout.source == 'Zwift' ? Icons.videogame_asset : Icons.speed,
                  color: Colors.white,
                ),
              ),
              title: Text(workout.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${workout.date.toString().split(' ')[0]}'),
                  Text('${workout.distanceKm} km • ${workout.duration.inMinutes} min'),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${workout.avgPowerWatts}W',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Avg Power',
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/workout_detail',
                  arguments: workout,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
