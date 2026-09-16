import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

// Screen 3: Appointment Booking Form
// Uses: TextField, DropdownButton, Checkbox, Radio, Switch, ElevatedButton, AlertDialog, TextButton, SnackBar
class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  // 1. Controllers for TextFields
  final TextEditingController _nameController = TextEditingController(text: 'Swaraj Wattamwar');
  final TextEditingController _phoneController = TextEditingController(text: '9876543210');
  final TextEditingController _reasonController = TextEditingController();

  // 2. State variables for Dropdown, Radio, Checkbox, Switch
  String _selectedDoctor = doctorDepartments.first;
  String _consultationMode = 'In-Person'; // For Radio buttons
  bool _isFirstTimeVisit = false;          // For Checkbox
  bool _smsReminder = true;               // For Switch

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  // Method to display the AlertDialog (Widget Requirement: AlertDialog, TextButton)
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.check_circle_outline, color: Colors.teal),
              SizedBox(width: 8),
              Text('Confirm Booking'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Patient: ${_nameController.text}'),
              const SizedBox(height: 4),
              Text('Doctor: $_selectedDoctor'),
              const SizedBox(height: 4),
              Text('Mode: $_consultationMode'),
              const SizedBox(height: 4),
              Text('First Visit: ${_isFirstTimeVisit ? "Yes" : "No"}'),
              const SizedBox(height: 4),
              Text('SMS Reminder: ${_smsReminder ? "Enabled" : "Disabled"}'),
            ],
          ),
          actions: [
            // Cancel TextButton
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close dialog
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            // Confirm TextButton
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close dialog

                // Show SnackBar feedback (Widget Requirement: SnackBar)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Appointment confirmed with $_selectedDoctor!'),
                    backgroundColor: Colors.teal,
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              child: const Text('Confirm', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Book Doctor Appointment',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          const SizedBox(height: 16),

          // 1. Patient Name TextField (Widget Requirement: TextField)
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Patient Full Name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 14),

          // 2. Contact Phone TextField
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Contact Number',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 14),

          // 3. DropdownButton for selecting Doctor/Department (Widget Requirement: DropdownButton)
          const Text('Select Department & Doctor:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: _selectedDoctor,
                items: doctorDepartments.map((String doctor) {
                  return DropdownMenuItem<String>(
                    value: doctor,
                    child: Text(doctor, style: const TextStyle(fontSize: 14)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedDoctor = newValue;
                    });
                  }
                },
              ),
            ),
          ),

          const SizedBox(height: 14),

          // 4. Consultation Type using Radio buttons (Widget Requirement: Radio)
          const Text('Consultation Mode:', style: TextStyle(fontWeight: FontWeight.bold)),
          RadioGroup<String>(
            groupValue: _consultationMode,
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  _consultationMode = value;
                });
              }
            },
            child: const Row(
              children: [
                Radio<String>(value: 'In-Person'),
                Text('In-Person Clinic'),
                SizedBox(width: 16),
                Radio<String>(value: 'Online'),
                Text('Online Call'),
              ],
            ),
          ),

          const Divider(),

          // 5. First-time Patient Checkbox (Widget Requirement: Checkbox)
          Row(
            children: [
              Checkbox(
                value: _isFirstTimeVisit,
                activeColor: Colors.teal,
                onChanged: (bool? value) {
                  setState(() {
                    _isFirstTimeVisit = value ?? false;
                  });
                },
              ),
              const Expanded(
                child: Text('This is my first time visiting this clinic/doctor'),
              ),
            ],
          ),

          // 6. SMS Reminder Switch (Widget Requirement: Switch)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Send SMS Reminder 2 hours before', style: TextStyle(fontSize: 14)),
              Switch(
                value: _smsReminder,
                activeThumbColor: Colors.teal,
                onChanged: (bool value) {
                  setState(() {
                    _smsReminder = value;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 7. Submit Button (Widget Requirement: ElevatedButton)
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {
                // Validation check
                if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill out all required fields!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                _showConfirmationDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              icon: const Icon(Icons.calendar_month),
              label: const Text('Book Appointment', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
