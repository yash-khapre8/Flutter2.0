import 'package:flutter/material.dart';

// --- PATIENT DATA ---
// Simple hard-coded patient information
class PatientData {
  static const String name = 'Swaraj Wattamwar';
  static const String age = '21 Years';
  static const String gender = 'Male';
  static const String bloodGroup = 'O+';
  static const String height = '175 cm';
  static const String weight = '68 kg';
  static const String emergencyContact = '+91 98765 43210';
  static const String allergies = 'Penicillin, Dust';
}

// --- HEALTH METRIC ITEM ---
// Simple class to hold metric information
class HealthMetric {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  const HealthMetric({
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
  });
}

// Dummy list of health metrics for GridView
final List<HealthMetric> dummyMetrics = [
  const HealthMetric(
    title: 'Heart Rate',
    value: '72',
    unit: 'bpm',
    icon: Icons.favorite,
    color: Colors.red,
  ),
  const HealthMetric(
    title: 'Blood Pressure',
    value: '120/80',
    unit: 'mmHg',
    icon: Icons.speed,
    color: Colors.blue,
  ),
  const HealthMetric(
    title: 'Blood Sugar',
    value: '95',
    unit: 'mg/dL',
    icon: Icons.water_drop,
    color: Colors.orange,
  ),
  const HealthMetric(
    title: 'Water Intake',
    value: '2.5 / 3.0',
    unit: 'Liters',
    icon: Icons.local_drink,
    color: Colors.cyan,
  ),
  const HealthMetric(
    title: 'Daily Steps',
    value: '6,420',
    unit: 'steps',
    icon: Icons.directions_walk,
    color: Colors.green,
  ),
  const HealthMetric(
    title: 'Sleep',
    value: '7.5',
    unit: 'hours',
    icon: Icons.bedtime,
    color: Colors.deepPurple,
  ),
];

// --- HEALTH TIP ITEM ---
// Simple class to hold health advice tips
class HealthTip {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const HealthTip({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

// Dummy list of health tips for ListView
final List<HealthTip> dummyTips = [
  const HealthTip(
    title: 'Stay Hydrated',
    description: 'Drink at least 8 to 10 glasses of clean water daily to keep organs functioning smoothly.',
    icon: Icons.water_drop_outlined,
    color: Colors.blue,
  ),
  const HealthTip(
    title: '30-Minute Daily Walk',
    description: 'A brisk 30-minute daily walk strengthens your heart, improves mood, and burns calories.',
    icon: Icons.directions_walk,
    color: Colors.green,
  ),
  const HealthTip(
    title: 'Eat Fresh Greens & Fruits',
    description: 'Add raw veggies and fresh seasonal fruits to your daily meals for essential vitamins and fiber.',
    icon: Icons.restaurant,
    color: Colors.orange,
  ),
  const HealthTip(
    title: 'Get 7-8 Hours of Sleep',
    description: 'Consistent restful sleep repairs body cells, boosts memory, and strengthens immunity.',
    icon: Icons.nightlight_round,
    color: Colors.purple,
  ),
  const HealthTip(
    title: 'Limit Screen Time',
    description: 'Take a 5-minute break every hour to rest your eyes and stretch your neck and back muscles.',
    icon: Icons.remove_red_eye_outlined,
    color: Colors.teal,
  ),
];

// Doctors list for DropdownButton
final List<String> doctorDepartments = [
  'General Physician - Dr. Rajesh',
  'Cardiologist - Dr. Ananya',
  'Dermatologist - Dr. Priya',
  'Orthopedic - Dr. Vikram',
  'Dentist - Dr. Neha',
];
