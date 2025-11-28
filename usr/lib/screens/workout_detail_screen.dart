import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutDetailScreen extends StatelessWidget {
  const WorkoutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments
    final workout = ModalRoute.of(context)!.settings.arguments as Workout;

    return Scaffold(
      appBar: AppBar(
        title: Text(workout.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Stats
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _DetailStat(label: 'Power', value: '${workout.avgPowerWatts}W', icon: Icons.flash_on, color: Colors.amber),
                  _DetailStat(label: 'HR', value: '${workout.avgHeartRate}bpm', icon: Icons.favorite, color: Colors.red),
                  _DetailStat(label: 'Dist', value: '${workout.distanceKm}km', icon: Icons.directions_bike, color: Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            Text('Analysis', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            
            // Placeholder for Charts
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.show_chart, size: 48, color: Colors.grey),
                    const SizedBox(height: 8),
                    Text(
                      'Power Curve Analysis',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                    ),
                    Text(
                      '(Chart Placeholder)',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Zones Placeholder
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Power Zones', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 16),
                  _ZoneBar(label: 'Z1 Active Recovery', percent: 0.15, color: Colors.grey),
                  _ZoneBar(label: 'Z2 Endurance', percent: 0.45, color: Colors.blue),
                  _ZoneBar(label: 'Z3 Tempo', percent: 0.25, color: Colors.green),
                  _ZoneBar(label: 'Z4 Threshold', percent: 0.10, color: Colors.yellow),
                  _ZoneBar(label: 'Z5 VO2 Max', percent: 0.05, color: Colors.red),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Source Info
            Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  'Recorded on ${workout.source} • ${workout.date.toString()}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _DetailStat({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

class _ZoneBar extends StatelessWidget {
  final String label;
  final double percent;
  final Color color;

  const _ZoneBar({
    required this.label,
    required this.percent,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 12)),
              Text('${(percent * 100).toInt()}%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percent,
            backgroundColor: color.withOpacity(0.2),
            color: color,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}
