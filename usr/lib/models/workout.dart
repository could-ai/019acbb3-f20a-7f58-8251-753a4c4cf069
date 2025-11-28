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
      ),
    ];
  }
}
