import 'package:flutter/material.dart';
import 'screens/patient_details_screen.dart';
import 'screens/health_metrics_screen.dart';
import 'screens/appointment_screen.dart';
import 'screens/health_tips_screen.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(const MyHealthTrackerApp());
}

// Root Application Widget
class MyHealthTrackerApp extends StatelessWidget {
  const MyHealthTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Health Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins', // Google Font integrated locally
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// Main Home Screen containing Scaffold, AppBar, Drawer, and BottomNavigationBar
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Current selected tab index in BottomNavigationBar
  int _currentIndex = 0;

  // List of 4 main screens matching the requirements
  final List<Widget> _screens = const [
    PatientDetailsScreen(), // Screen 1: Patient Profile & Details
    HealthMetricsScreen(),  // Screen 2: Health Metrics Grid
    AppointmentScreen(),    // Screen 3: Appointment Booking Form
    HealthTipsScreen(),     // Screen 4: Health Tips List
  ];

  // Screen titles corresponding to tabs
  final List<String> _titles = const [
    'Patient Profile',
    'Health Metrics',
    'Book Appointment',
    'Health Tips',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Top AppBar (Widget Requirement: AppBar, Text, IconButton)
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          // Quick info icon button showing a SnackBar
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'App Info',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('My Health Tracker v1.0 • Healthcare Mini Project'),
                  backgroundColor: Colors.teal,
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),

      // 2. Navigation Drawer (Widget Requirement: Drawer, Image, Text, Icon)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with Profile
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Avatar with fallback to asset image or icon
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/flower.jpg',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person, size: 36, color: Colors.teal),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              PatientData.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Age: ${PatientData.age} | ${PatientData.bloodGroup}',
                              style: TextStyle(color: Colors.white70, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Navigation ListTiles inside Drawer
            ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: const Text('Patient Details'),
              selected: _currentIndex == 0,
              onTap: () {
                setState(() => _currentIndex = 0);
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.monitor_heart, color: Colors.teal),
              title: const Text('Health Metrics'),
              selected: _currentIndex == 1,
              onTap: () {
                setState(() => _currentIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.teal),
              title: const Text('Book Appointment'),
              selected: _currentIndex == 2,
              onTap: () {
                setState(() => _currentIndex = 2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb_outline, color: Colors.teal),
              title: const Text('Health Tips'),
              selected: _currentIndex == 3,
              onTap: () {
                setState(() => _currentIndex = 3);
                Navigator.pop(context);
              },
            ),

            const Divider(),

            // Emergency helpline tile
            ListTile(
              leading: const Icon(Icons.emergency, color: Colors.red),
              title: const Text('Emergency Helpline'),
              subtitle: const Text('Dial 112 / 108'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Emergency Contact'),
                    content: const Text('Call Hospital Helpline: 108\nAmbulance: 102'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // 3. Main Screen Body (Switches based on current tab index)
      body: _screens[_currentIndex],

      // 4. Bottom Navigation Bar (Widget Requirement: BottomNavigationBar)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Patient',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Metrics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_calendar_outlined),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates_outlined),
            label: 'Tips',
          ),
        ],
      ),
    );
  }
}
