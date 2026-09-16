import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

// Screen 1: Patient Profile & Details
// Uses: Stack, Card, Container, Column, Row, CircleAvatar, Icon, Text
class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Profile Banner using Stack (Widget Requirement: Stack)
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Background card
              Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.teal, Colors.tealAccent],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              // Avatar positioned on top of the banner
              const Positioned(
                bottom: -35,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, size: 48, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 45),

          // Patient Name and Subtitle
          const Center(
            child: Column(
              children: [
                Text(
                  PatientData.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Patient ID: #HT-2026-09',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 2. Personal Info Card (Widget Requirement: Card, Row, Column, Icon, Text)
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  const Divider(),
                  const SizedBox(height: 8),

                  // Age and Gender Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoItem(Icons.cake, 'Age', PatientData.age),
                      _buildInfoItem(Icons.person_outline, 'Gender', PatientData.gender),
                      _buildInfoItem(Icons.bloodtype, 'Blood Group', PatientData.bloodGroup),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 3. Body Measurements Card
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Physical Metrics',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoItem(Icons.height, 'Height', PatientData.height),
                      _buildInfoItem(Icons.monitor_weight_outlined, 'Weight', PatientData.weight),
                      _buildInfoItem(Icons.accessibility_new, 'BMI', '22.2 (Normal)'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 4. Emergency & Medical Alert Card
          Card(
            elevation: 3,
            color: Colors.red.shade50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Medical Alert & Emergency',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 6),
                  Text('Emergency Contact: ${PatientData.emergencyContact}',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 4),
                  Text('Known Allergies: ${PatientData.allergies}',
                      style: TextStyle(color: Colors.black87)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to display an icon, label, and value neatly in a column
  static Widget _buildInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal, size: 24),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
