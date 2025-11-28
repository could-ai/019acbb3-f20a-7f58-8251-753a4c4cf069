import 'package:flutter/material.dart';
import '../models/workout.dart';
import 'workout_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = Workout.getMockWorkouts();
    final totalDistance = workouts.fold(0.0, (sum, item) => sum + item.distanceKm);
    final totalCalories = workouts.fold(0, (sum, item) => sum + item.calories);
    final totalDuration = workouts.fold(Duration.zero, (sum, item) => sum + item.duration);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cycling Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weekly Summary',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    title: 'Distance',
                    value: '${totalDistance.toStringAsFixed(1)} km',
                    icon: Icons.directions_bike,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _SummaryCard(
                    title: 'Time',
                    value: '${totalDuration.inHours}h ${totalDuration.inMinutes.remainder(60)}m',
                    icon: Icons.timer,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    title: 'Calories',
                    value: '$totalCalories kcal',
                    icon: Icons.local_fire_department,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _SummaryCard(
                    title: 'Workouts',
                    value: '${workouts.length}',
                    icon: Icons.fitness_center,
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Activities',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/workouts');
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...workouts.take(3).map((workout) => _WorkoutListTile(workout: workout)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Placeholder for import functionality
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Import functionality coming soon!')),
          );
        },
        label: const Text('Import Ride'),
        icon: const Icon(Icons.upload_file),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkoutListTile extends StatelessWidget {
  final Workout workout;

  const _WorkoutListTile({required this.workout});

  @override
  Widget build(BuildContext context) {
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
        subtitle: Text(
          '${workout.date.day}/${workout.date.month} • ${workout.distanceKm} km • ${workout.avgPowerWatts}W',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/workout_detail',
            arguments: workout,
          );
        },
      ),
    );
  }
}
