import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Concepts Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose a Concept',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Card 1 - Forms
            _NavCard(
              icon: Icons.assignment,
              title: 'User Input & Forms',
              color: Colors.blue,
              route: '/form',
            ),

            const SizedBox(height: 16),

            // Card 2 - Images & Fonts
            _NavCard(
              icon: Icons.image,
              title: 'Images, Assets & Fonts',
              color: Colors.green,
              route: '/images',
            ),

            const SizedBox(height: 16),

            // Card 3 - Animations
            _NavCard(
              icon: Icons.animation,
              title: 'Animations',
              color: Colors.orange,
              route: '/animation',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final String route;

  const _NavCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 28),
        label: Text(title, style: const TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
