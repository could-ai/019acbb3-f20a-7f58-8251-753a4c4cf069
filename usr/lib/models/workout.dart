class Workout {
  final String id;
  final String title;
  final DateTime date;
  final Duration duration;
  final double distanceKm;
  final int avgPowerWatts;
  final int avgHeartRate;
  final int calories;
  final String source; // 'Zwift' or 'Wahoo Bolt'
  final List<Lap> laps;

  Workout({
    required this.id,
    required this.title,
    required this.date,
    required this.duration,
    required this.distanceKm,
    required this.avgPowerWatts,
    required this.avgHeartRate,
    required this.calories,
    required this.source,
    required this.laps,
  });

  // Mock data generator
  static List<Workout> getMockWorkouts() {
    return [
      Workout(
        id: '1',
        title: 'Watopia Flat Route',
        date: DateTime.now().subtract(const Duration(days: 1)),
        duration: const Duration(hours: 1, minutes: 5),
        distanceKm: 32.5,
        avgPowerWatts: 210,
        avgHeartRate: 145,
        calories: 650,
        source: 'Zwift',
        laps: [
          Lap(index: 1, duration: const Duration(minutes: 10), avgPowerWatts: 180, avgHeartRate: 130, minHeartRate: 110, maxHeartRate: 145),
          Lap(index: 2, duration: const Duration(minutes: 20), avgPowerWatts: 220, avgHeartRate: 155, minHeartRate: 140, maxHeartRate: 165),
          Lap(index: 3, duration: const Duration(minutes: 15), avgPowerWatts: 200, avgHeartRate: 148, minHeartRate: 135, maxHeartRate: 155),
          Lap(index: 4, duration: const Duration(minutes: 20), avgPowerWatts: 230, avgHeartRate: 160, minHeartRate: 150, maxHeartRate: 175),
        ],
      ),
      Workout(
        id: '2',
        title: 'Morning Spin',
        date: DateTime.now().subtract(const Duration(days: 3)),
        duration: const Duration(minutes: 45),
        distanceKm: 20.0,
        avgPowerWatts: 180,
        avgHeartRate: 130,
        calories: 400,
        source: 'Wahoo Bolt',
        laps: [
          Lap(index: 1, duration: const Duration(minutes: 15), avgPowerWatts: 170, avgHeartRate: 125, minHeartRate: 110, maxHeartRate: 135),
          Lap(index: 2, duration: const Duration(minutes: 15), avgPowerWatts: 185, avgHeartRate: 132, minHeartRate: 120, maxHeartRate: 140),
          Lap(index: 3, duration: const Duration(minutes: 15), avgPowerWatts: 185, avgHeartRate: 133, minHeartRate: 125, maxHeartRate: 142),
        ],
      ),
      Workout(
        id: '3',
        title: 'Alpe du Zwift',
        date: DateTime.now().subtract(const Duration(days: 5)),
        duration: const Duration(hours: 1, minutes: 45),
        distanceKm: 25.0,
        avgPowerWatts: 240,
        avgHeartRate: 165,
        calories: 1100,
        source: 'Zwift',
        laps: [
          Lap(index: 1, duration: const Duration(minutes: 10), avgPowerWatts: 150, avgHeartRate: 120, minHeartRate: 100, maxHeartRate: 130),
          Lap(index: 2, duration: const Duration(minutes: 60), avgPowerWatts: 260, avgHeartRate: 175, minHeartRate: 160, maxHeartRate: 185),
          Lap(index: 3, duration: const Duration(minutes: 35), avgPowerWatts: 220, avgHeartRate: 155, minHeartRate: 140, maxHeartRate: 165),
        ],
      ),
    ];
  }
}

class Lap {
  final int index;
  final Duration duration;
  final int avgPowerWatts;
  final int avgHeartRate;
  final int minHeartRate;
  final int maxHeartRate;

  Lap({
    required this.index,
    required this.duration,
    required this.avgPowerWatts,
    required this.avgHeartRate,
    required this.minHeartRate,
    required this.maxHeartRate,
  });

  // Helpers for display formats
  int get durationInSeconds => duration.inSeconds;
  
  String get durationMinSec {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  String get durationHrMinSec {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
